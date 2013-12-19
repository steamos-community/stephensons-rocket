#!/bin/sh
BUILD=./buildroot
APTCONF="./ftparchive/apt-ftparchive.conf"
DIST="alchemist"
ISOPATH="."
ISONAME="yeolde.iso"
UPSTREAMURL="http://repo.steampowered.com"

#Show how to use the command
usage ( )
{
        cat <<EOF
        $0 [OPTION]
        -h                Print this message
	-r                Recreate buildroot directory
	-b                Dowload and build alchemist_beta
EOF
}

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

rebuild ( ) {
	if [ -n "${rebuild}" ]; then
		echo "Building ${BUILD} from scratch"
		rm -fr "${BUILD}"
	fi
}

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

beta ( ) {
	#Change a few things for a beta build
	DIST="${DISTNAME}_beta"
	ISONAME="yeolde-beta.iso"	
	APTCONF="./ftparchive/apt-ftparchive-beta.conf"
	
	echo "Mirroring alchemist_beta into ${BUILD}, please wait..."
	mirrordirs="steamos/dists/alchemist_beta steamos/pool"
	for dir in ${mirrordirs}; do
		wget -q -m -np -nH --cut-dirs=1 -E -R *.html -P ${BUILD} ${UPSTREAMURL}/${dir}
	done

	echo "Copying beta into ${BUILD}"
	rsync -a beta/ ${BUILD}/
}

create ( ) {
	#Copy over updated and added debs
	#First remove uneeded debs
	debstoremove="pool/main/x/xserver-xorg-video-vmware/xserver-xorg-video-vmware_12.0.2-1+bsos6_amd64.deb"
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
	yeoldfiles="default.preseed isolinux post_install.sh"
	for file in ${yeoldfiles}; do
		echo "Copying ${file} into ${BUILD}"
		cp -pfr ${file} ${BUILD}
	done

	#Generate our new repos
	echo "Generating Packages.."
	apt-ftparchive generate ${APTCONF}
	echo "Genereating Release for ${DIST}"
	apt-ftparchive -c ${APTCONF} release ${BUILD}/dists/${DIST} > ${BUILD}/dists/${DIST}/Release

	#Replace testing with alchemist
	testingdir="${BUILD}/dists/testing"
	echo "Replacing ${testingdir} ..."
	if [ -d ${testingdir} ]; then
		rm -fr "${testingdir}"
		mkdir -p ${testingdir}
		rsync -a ${BUILD}/dists/${DIST}/ ${testingdir}/
	fi

	#gpg --default-key "0E1FAD0C" --output $BUILD/dists/$DISTNAME/Release.gpg -ba $BUILD/dists/$DISTNAME/Release
	cd ${BUILD}
	find . -type f -print0 | xargs -0 md5sum > md5sum.txt
	cd -

	#Remove old iso
	if [ -f ${ISOPATH}/${ISONAME} ]; then
		rm -f "${ISOPATH}/${ISONAME}"
	fi

	echo "Building ${ISOPATH}/${ISONAME} ..."
	xorriso -as mkisofs -r -checksum_algorithm_iso md5,sha1,sha256,sha512 \
		-V 'Ye Olde SteamOSe 1.0b1a1' -o ${ISOPATH}/${ISONAME} \
		-J -isohybrid-mbr /usr/lib/syslinux/isohdpfx.bin \
		-joliet-long -b isolinux/isolinux.bin \
		-c isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
		-boot-info-table -eltorito-alt-boot -e boot/grub/efi.img \
		-no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus ${BUILD}
}

while getopts "hrb" OPTION; do
        case ${OPTION} in
        h)
                usage
                exit 1
        ;;
        r)
                rebuild="1"
        ;;
        b)
                beta="1"
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

#Remove ${BUILD} if set
if [ -n "${rebuild}" ]; then
	rebuild
fi

#Make sure our BUILD dir exists
if [ ! -d ${BUILD} ]; then
	mkdir -p ${BUILD}
fi

#Download and extract the SteamOSInstaller.zip
extract

#Download and create beta if desired
if [ -n "${beta}" ];then
	beta
fi

#Build everything
create
