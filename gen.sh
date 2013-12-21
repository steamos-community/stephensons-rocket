#!/bin/sh

#Basic variables
BUILD="./buildroot"
APTCONF="./ftparchive/apt-ftparchive.conf"
DISTNAME="alchemist"
ISOPATH="."
ISONAME="yeolde.iso"
ISOVNAME="Olde SteamOSe Beta 2013-12-19"
UPSTREAMURL="http://repo.steampowered.com"

#Show how to use gen.sh
usage ( )
{
	cat <<EOF
	$0 [OPTION]
	-h                Print this message
EOF
}

#Check some basic dependencies this script needs to run
deps ( ) {
	#Check dependencies
	deps="apt-utils xorriso syslinux rsync wget unzip"
	for dep in ${deps}; do
		if dpkg-query -s ${dep} >/dev/null 2>&1; then
			:
		else
			echo "Missing dependency: ${dep}"
			echo "Install with: sudo apt-get install ${dep}"
			exit 1
		fi
	done
}

#Remove the ${BUILD} directory to start from scratch
rebuild ( ) {
	if [ -d "${BUILD}" ]; then
		echo "Building ${BUILD} from scratch"
		rm -fr "${BUILD}"
	fi
}

#Extract the upstream SteamOSInstaller.zip from repo.steampowered.com
extract ( ) {
	#Download SteamOSInstaller.zip
	steaminstallfile="SteamOSInstaller.zip"
	steaminstallerurl="${UPSTREAMURL}/download/${steaminstallfile}"
	if [ ! -f ${steaminstallfile} ]; then
		echo "Downloading ${steaminstallerurl} ..."
		if wget -N ${steaminstallerurl}; then
			:
		else
			echo "Error downloading ${steaminstallerurl}!"
			exit 1
		fi
	else
		echo "Using existing ${steaminstallfile}"
	fi

	#Unzip SteamOSInstaller.zip into BUILD
	if unzip -uo ${steaminstallfile} -d ${BUILD}; then
		:
	else
		echo "Error unzipping ${steaminstallfile} into ${BUILD}!"
		exit 1
	fi
}

#Configure YeOlde installer by:
#	Removing uneeded debs
#	Copy over modified/updated debs
#	Copy over YeOlde files
#	Re-generate pressed files
#	Re-build the cdrom installer package repositories
#	Generate md5sums
#	Build ISO
create ( ) {
	#Copy over updated and added debs
	#First remove uneeded debs
	debstoremove=""
	for debremove in ${debstoremove}; do
		if [ -f ${BUILD}/${debstoremove} ]; then
			echo "Removing ${BUILD}/${debstoremove}..."
			rm -fr "${BUILD}/${debstoremove}"
		fi
	done

	#Rsync over our local pool dir
	pooldir="./pool"
	echo "Copying ${pooldir} into ${BUILD}..."
	if rsync -av ${pooldir} ${BUILD}; then
		:
	else
		echo "Error copying ${pooldir} to ${BUILD}"
		exit 1
	fi
	#Copy over the rest of our modified files
	yeoldfiles="poweruser.preseed boot isolinux post_install.sh"
	for file in ${yeoldfiles}; do
		echo "Copying ${file} into ${BUILD}"
		cp -pfr ${file} ${BUILD}
	done

	#Generate default.preseed
	echo "Generating default.preseed"
	cp -pfr ${BUILD}/poweruser.preseed ${BUILD}/default.preseed
	cat default.stub >> ${BUILD}/default.preseed

	#Generate our new repos
	echo "Generating Packages.."
	apt-ftparchive generate ${APTCONF}
	echo "Genereating Release for ${DISTNAME}"
	apt-ftparchive -c ${APTCONF} release ${BUILD}/dists/${DISTNAME} > ${BUILD}/dists/${DISTNAME}/Release

	#Replace testing with alchemist
	testingdir="${BUILD}/dists/testing"
	echo "Replacing ${testingdir} ..."
	if [ -d ${testingdir} ]; then
		rm -fr "${testingdir}"
		mkdir -p ${testingdir}
		rsync -a ${BUILD}/dists/${DISTNAME}/ ${testingdir}/
	fi

	#gpg --default-key "0E1FAD0C" --output $BUILD/dists/$DISTNAME/Release.gpg -ba $BUILD/dists/$DISTNAME/Release
	cd ${BUILD}
	find . -type f -print0 | xargs -0 md5sum > md5sum.txt
	cd -

	#Remove old ISO
	if [ -f ${ISOPATH}/${ISONAME} ]; then
		rm -f "${ISOPATH}/${ISONAME}"
	fi

	#Build the ISO
	echo "Building ${ISOPATH}/${ISONAME} ..."
	xorriso -as mkisofs -r -checksum_algorithm_iso md5,sha1,sha256,sha512 \
		-V "${ISOVNAME}" -o ${ISOPATH}/${ISONAME} \
		-J -isohybrid-mbr /usr/lib/syslinux/isohdpfx.bin \
		-joliet-long -b isolinux/isolinux.bin \
		-c isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
		-boot-info-table -eltorito-alt-boot -e boot/grub/efi.img \
		-no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus ${BUILD}
}

#Setup command line arguments
while getopts "hr" OPTION; do
        case ${OPTION} in
        h)
                usage
                exit 1
        ;;
        *)
                echo "${OPTION} - Unrecongnized option"
                usage
                exit 1
        ;;
        esac
done

#Check dependencies
deps

#Rebuild ${BUILD}
rebuild

#Make sure ${BUILD} exists
if [ ! -d ${BUILD} ]; then
	mkdir -p ${BUILD}
fi

#Download and extract the SteamOSInstaller.zip
extract

#Build everything for YeOlde installer
create
