#!/bin/sh
#Basic variables
BUILD="./buildroot"
APTCONF="./ftparchive/apt-ftparchive.conf"
APTUDEBCONF="./ftparchive/apt-ftparchive-udeb.conf"
DISTNAME="brewmaster"
CACHEDIR="./cache"
ISOPATH="."
ISONAME="rocket.iso"
ISOVNAME="Stephensons Rocket 2.64plus1"
UPSTREAMURL="http://repo.steampowered.com"
STEAMINSTALLFILE="SteamOSDVD.iso"
MD5SUMFILE="MD5SUMS"
KNOWNINSTALLER="2b5341fb2843e83471838ba6bf05da17"
REPODIR="./archive-mirror/mirror/repo.steampowered.com/steamos"

#Show how to use gen.sh
usage ( )
{
	cat <<EOF
	$0 [OPTION] [MOD1] [MOD2] [MOD3] ...
	-h                Print this message
	-d		  Re-Download ${STEAMINSTALLFILE}
	-n		  Set the name for the iso
EOF
}

#Check some basic dependencies this script needs to run
deps ( ) {
	#Check dependencies
	deps="apt-utils xorriso syslinux rsync wget lftp p7zip-full realpath"
	for dep in ${deps}; do
		if dpkg-query -s ${dep} >/dev/null 2>&1; then
			:
		else
			echo "Missing dependency: ${dep}"
			echo "Install with: sudo apt-get install ${dep}"
			exit 1
		fi
	done
	if test "`expr length \"$ISOVNAME\"`" -gt "32"; then
		echo "Volume ID is more than 32 characters: ${ISOVNAME}"
		exit 1
	fi

	#Check xorriso version is compatible, must be 1.2.4 or higher
	xorrisover=`xorriso --version 2>&1 | egrep -e "^xorriso version" | awk '{print $4}'`
	reqxorrisover=1.2.4
	if dpkg --compare-versions ${xorrisover} ge ${reqxorrisover} >/dev/null 2>&1; then
		echo "PASS: xorriso version ${xorrisover} supports required functions."
	else
		echo "ERROR: xorriso version ${xorrisover} is too to old. Please upgrade to xorriso version ${reqxorrisover} or higher."
		exit 1
	fi
}

#Remove the ${BUILD} directory to start from scratch
rebuild ( ) {
	if [ -d "${BUILD}" ]; then
		echo "Building ${BUILD} from scratch"
		rm -fr "${BUILD}"
	fi
}

#Report on obsolete packages
obsoletereport ( ) {
	if [ ! -d ${REPODIR} ]; then
		echo "No ${REPODIR} directory exists, run archive-mirror.sh if you want this script to report obsolete packages"
	else
		echo "Reporting on packages which are different in ${BUILD} than ${REPODIR}"
		echo "\nPackagename\t\ttype\tarch\told version\tnew version\n"
		REPODIR="`realpath ${REPODIR}`"
		cd ${BUILD}/pool/
		for i in */*/*/*.*deb
			do PKGNAME=`basename $i | cut -f1 -d'_'`
			ARCHNAME=`basename $i | cut -f3 -d'_' | cut -f1 -d'.'`
			PKGPATH=`dirname $i`;PKGVER=`basename $i | cut -f2 -d'_'`
			DEBTYPE=`basename $i | sed 's/.*\.//g'`
			if [ `ls -1 ${REPODIR}/pool/${PKGPATH}/${PKGNAME}_*_${ARCHNAME}.${DEBTYPE} 2> /dev/null | wc -l` -gt 0 ]
				then NEWPKGVER=$(basename `ls -1 ${REPODIR}/pool/${PKGPATH}/${PKGNAME}_*_${ARCHNAME}.${DEBTYPE} | sort -n | tail -1` | cut -f2 -d'_')
				if [ "x${PKGVER}" != "x${NEWPKGVER}" ]
					then echo "${PKGNAME}\t\t${DEBTYPE}\t${ARCHNAME}\t${PKGVER}\t${NEWPKGVER}"
				fi
			fi
		done
		cd -
	fi
}

#Extract the upstream SteamOSDVD.iso from repo.steampowered.com
extract ( ) {
	#Download SteamOSDVD.iso
	steaminstallerurl="${UPSTREAMURL}/download/brewmaster/${STEAMINSTALLFILE}"
	#Download if the iso doesn't exist or the -d flag was passed
	if [ ! -f ${STEAMINSTALLFILE} ] || [ -n "${redownload}" ]; then
		if [ -f ${STEAMINSTALLFILE} ];then
			rm ${STEAMINSTALLFILE}
		fi
		echo "Downloading ${steaminstallerurl} ..."
		if lftp -e "pget -n 8 ${steaminstallerurl}"; then
			:
		else
			echo "Error downloading ${steaminstallerurl}!"
			exit 1
		fi
	else
		echo "Using existing ${STEAMINSTALLFILE}"
	fi

	#Extract SteamOSDVD.iso into BUILD
	if 7z x ${STEAMINSTALLFILE} -o${BUILD}; then
		:
	else
		echo "Error extracting ${STEAMINSTALLFILE} into ${BUILD}!"
		exit 1
	fi
	rm -fr ${BUILD}/\[BOOT\]
}

verify ( ) {
	#Does this installer look familiar?
	upstreaminstallermd5sum=` wget --quiet -O- ${UPSTREAMURL}/download/brewmaster/${MD5SUMFILE} | grep SteamOSDVD.iso$ | cut -f1 -d' '`
	localinstallermd5sum=`md5sum ${STEAMINSTALLFILE} | cut -f1 -d' '`
	if test "${localinstallermd5sum}" = "${KNOWNINSTALLER}"; then
		echo "Downloaded installer matches this version of gen.sh"
	elif test "${upstreaminstallermd5sum}" = "${KNOWNINSTALLER}"; then
		echo "Local installer is missing or obsolete"
		echo "Upstream version matches expectations, forcing update"
		redownload="1"
	else
		echo "ERROR! Local installer and remote installer both unknown" >&2
		echo "ERROR! Please update gen.sh to support unknown ${STEAMINSTALLFILE}" >&2
		exit 1
	fi
}

#Configure Rocket installer by:
#	Removing uneeded debs
#	Copy over modified/updated debs
#	Copy over Rocket files
#	Re-generate pressed files
#	Re-build the cdrom installer package repositories
#	Generate md5sums
#	Build ISO
createbuildroot ( ) {

	#Delete 32-bit udebs and d-i, as SteamOS is 64-bit only
	echo "Deleting 32-bit garbage from ${BUILD}..."
	find ${BUILD} -name "*_i386.udeb" -type f -exec rm -rf {} \;
	find ${BUILD} -name "*_i386.deb" | egrep -v "(\/steamos-modeswitch-inhibitor\/|\/glibc\/|\/elfutils\/|\/expat\/|\/fglrx-driver\/|\/gcc-4.9\/|\/libdrm\/|\/libffi\/|\/libpciaccess\/|\/libvdpau\/|\/libx11\/|\/libxau\/|\/libxcb\/|\/libxdamage\/|\/libxdmcp\/|\/libxext\/|\/libxfixes\/|\/libxxf86vm\/|\/libxrandr\/|\/llvm-toolchain-3.5\/|\/mesa\/|\/nvidia-graphics-drivers\/|\/s2tc\/|\/zlib\/|\/udev\/|\/libxshmfence\/|\/steam\/|\/intel-vaapi-driver\/|\/libva\/|\/systemd\/|\/libedit\/|\/ncurses\/|\/libxrender\/|\/libbsd\/)" | xargs rm -f
	rm -fr "${BUILD}/install.386"
	rm -fr "${BUILD}/dists/*/main/debian-installer/binary-i386/"

	#Copy over updated and added debs
	#First remove uneeded debs
	debstoremove=""
	for debremove in ${debstoremove}; do
		if [ -f ${BUILD}/${debremove} ]; then
			echo "Removing ${BUILD}/${debremove}..."
			rm -fr "${BUILD}/${debremove}"
		fi
	done

	#Delete all firmware from /firmware/
	echo "Removing bundled firmware"
        rm -f ${BUILD}/firmware/*

	#Rsync over our local pool dir
	pooldir="./pool"
	echo "Copying ${pooldir} into ${BUILD}..."
	if rsync -av ${pooldir} ${BUILD}; then
		:
	else
		echo "Error copying ${pooldir} to ${BUILD}"
		exit 1
	fi

	#Symlink all firmware
        for firmware in `cat firmware.txt`; do
                echo "Symlinking ${firmware} into /firmware/ folder"
                ln -s ../${firmware} ${BUILD}/firmware/`basename ${firmware}`
        done

	#Copy over the rest of our modified files
	rocketfiles="default.preseed post_install.sh boot isolinux"
	for file in ${rocketfiles}; do
		echo "Copying ${file} into ${BUILD}"
		cp -pfr ${file} ${BUILD}
	done

	sed -i 's/fglrx-driver//' ${BUILD}/.disk/base_include
	sed -i 's/fglrx-modules-dkms//' ${BUILD}/.disk/base_include
	sed -i 's/libgl1-fglrx-glx//' ${BUILD}/.disk/base_include
	sed -i 's/nvidia-driver//' ${BUILD}/.disk/base_include
	echo "keyboard-configuration" >> ${BUILD}/.disk/base_include
}

# Removes old versions of packages before they end up on the iso
checkduplicates ( ) {
	echo ""
	echo "Removing duplicate packages:"
	
	# Create a list with all packages
	files=$(ls buildroot/pool/*/*/*/*|grep -v ":"|grep ".deb")
	
	# Find package names which are listed twice
	duplicates=$(echo $files|tr "\ " "\n"|cut -d"_" -f1|uniq -d)

	for curdupname in ${duplicates}; do
		curdupfiles=$(ls `echo "$files"|tr "\ " "\n"|grep "${curdupname}\_"|tr "\n" "\ "`)
		
		# Seperate packages with different architectures
		curdupamd64=$(echo $curdupfiles|tr "\ " "\n"|grep amd64)
		curdupi386=$(echo $curdupfiles|tr "\ " "\n"|grep i386)
		curdupall=$(echo $curdupfiles|tr "\ " "\n"|grep all)
		
		# Check the amount of packages per architecture
		nramd64=$(echo $curdupamd64|wc -w)
		nri386=$(echo $curdupi386|wc -w)
		nrall=$(echo $curdupall|wc -w)
		
		# Remove the everything but the latest package, good thing ls sorts alphabethically
		if [ ${nramd64} -gt 1 ]; then
			toremove=$(echo $curdupamd64|cut -f1-$((nramd64-1)) -d" ")
			echo "Removing: $toremove"
			rm ${toremove}
			tokeep=$(echo $curdupamd64|cut -f$((nramd64)) -d" ")
			echo "Keeping: $tokeep"
		fi
		if [ ${nri386} -gt 1 ]; then
			toremove=$(echo $curdupi386|cut -f1-$((nri386-1)) -d" ")
			echo "Removing: $toremove"
			rm ${toremove}
			tokeep=$(echo $curdupi386|cut -f$((nri386)) -d" ")
			echo "Keeping: $tokeep"
		fi
		if [ ${nrall} -gt 1 ]; then
			toremove=$(echo $curdupall|cut -f1-$((nrall-1)) -d" ")
			echo "Removing: $toremove"
			rm ${toremove}
			tokeep=$(echo $curdupall|cut -f$((nrall)) -d" ")
			echo "Keeping: $tokeep"
		fi

	done
	
	echo "Done"
}

addmod ( ) {
	echo "Added mod ${1}..."

	# check if the mod has been set and exists
	if [ -z ${1} ];then
		echo "No mod specified"
		return
	fi
	if [ ! -d ./${1} ];then
		echo "Mod directory ./${1} doesn't exist"
		return
	fi
	
	# read install from config file 
	modinstall=$(grep '^install' ./${1}/config|cut -d"=" -f2-)
	modremove=$(grep '^remove' ./${1}/config|cut -d"=" -f2-)
	
	# remove unwanted packages
	for rmpkg in ${modremove};do
		rm ${BUILD}/pool/*/*/*/${rmpkg}*
	done
	
	# add install to default.preseed of the build
	sed -i "/^d-i pkgsel\/include/ s/$/ ${modinstall}/" ${BUILD}/default.preseed
	
	# select sources.list file to use for mod
	if [ -f ./${1}/sources.list ];then
		modsources="./${1}/sources.list"
	else
		modsources="./sources.list"
	fi
	
	# add packages to pool
	cd ${1}
	if rsync -av --exclude 'pool/your-packages-here' ${pooldir} ../${BUILD}; then
		:
	else
		echo "Error copying ${1}/packages to ${BUILD}"
		exit 1
	fi
	cd - > /dev/null
	
	# use post_install script from mod, if available
	if [ -f ${1}/post_install.sh ];then
		cp -f ${1}/post_install.sh ${BUILD}
	fi
}

createiso ( ) {
	#Make sure ${CACHEDIR} exists
	if [ ! -d ${CACHEDIR} ]; then
		mkdir -p ${CACHEDIR}
	fi
	
	#Generate our new repos
	echo "Generating Packages.."
	apt-ftparchive generate ${APTCONF}
	apt-ftparchive generate ${APTUDEBCONF}
	echo "Generating Release for ${DISTNAME}"
	apt-ftparchive -c ${APTCONF} release ${BUILD}/dists/${DISTNAME} > ${BUILD}/dists/${DISTNAME}/Release

	#gpg --default-key "0E1FAD0C" --output $BUILD/dists/$DISTNAME/Release.gpg -ba $BUILD/dists/$DISTNAME/Release
	cd ${BUILD}
	find . -type f -print0 | xargs -0 md5sum > md5sum.txt
	cd -
	
	#Remove old ISO
	if [ -f ${ISOPATH}/${ISONAME} ]; then
		echo "Removing old ISO ${ISOPATH}/${ISONAME}"
		rm -f "${ISOPATH}/${ISONAME}"
	fi
	
	#Find isohdpfx.bin
	if [ -f "/usr/lib/syslinux/mbr/isohdpfx.bin" ]; then
		SYSLINUX="/usr/lib/syslinux/mbr/isohdpfx.bin"
	fi
	if [ -f "/usr/lib/syslinux/bios/isohdpfx.bin" ]; then
		SYSLINUX="/usr/lib/syslinux/bios/isohdpfx.bin"
	fi
	if [ -f "/usr/lib/syslinux/isohdpfx.bin" ]; then
		SYSLINUX="/usr/lib/syslinux/isohdpfx.bin"
	fi
	if [ -f "/usr/lib/ISOLINUX/isohdpfx.bin" ]; then
		SYSLINUX="/usr/lib/ISOLINUX/isohdpfx.bin"
	fi
	if [ -f "isohdpfx.bin" ]; then
		SYSLINUX="isohdpfx.bin"
	fi
	if [ -z $SYSLINUX ]; then
		echo "Error: isohdpfx.bin not found! Try putting it in ${pwd}."
		exit 1	
	fi
	
	#Build the ISO
	echo "Building ${ISOPATH}/${ISONAME} ..."
	xorriso -as mkisofs -r -checksum_algorithm_iso md5,sha1,sha256,sha512 \
		-V "${ISOVNAME}" -o ${ISOPATH}/${ISONAME} \
		-J -isohybrid-mbr ${SYSLINUX} \
		-joliet-long -b isolinux/isolinux.bin \
		-c isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
		-boot-info-table -eltorito-alt-boot -e boot/grub/efi.img \
		-no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus ${BUILD}
}

#Generate a file with the md5 checksum in it
mkchecksum ( ) {
	echo "Generating checksum..."
	md5sum ${ISONAME} > "${ISONAME}.md5"
	if [ -f ${ISONAME}.md5 ]; then
		echo "Checksum saved in ${ISONAME}.md5"
	else
		echo "Failed to save checksum"
	fi
}


#Setup command line arguments
while getopts "hdn:" OPTION; do
        case ${OPTION} in
        h)
                usage
                exit 1
        ;;
        d)
                redownload="1"
        ;;
        n)
        	ISOVNAME="${OPTARG}"
        	ISONAME=$(echo "${OPTARG}.iso"|tr '[:upper:]' '[:lower:]'|tr "\ " "-")
        ;;
        *)
                echo "${OPTION} - Unrecongnized option"
                usage
                exit 1
        ;;
        esac
done
shift $((OPTIND-1))
MODSTOADD="$@"

#Check dependencies
deps

#Rebuild ${BUILD}
rebuild

#Make sure ${BUILD} exists
if [ ! -d ${BUILD} ]; then
	mkdir -p ${BUILD}
fi

#Verify we have an expected installer
verify

#Download and extract the SteamOSInstaller.zip
extract

#Build buildroot for Rocket installer
createbuildroot

#Add mods to the iso
for MOD in ${MODSTOADD}; do
	addmod ${MOD}
done

#Check if there are multiple versions of packages in the buildroot
checkduplicates

#Build ISO for Rocket installer
createiso

#Generate rocket.iso.md5 file
mkchecksum

#Report on packages where newer is in the archive
obsoletereport
