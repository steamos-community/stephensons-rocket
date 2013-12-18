#!/bin/sh
BUILD=./buildroot
APTCONF=./ftparchive/apt-ftparchive.conf
DISTNAME=alchemist
ISOPATH="."
ISONAME="yeolde.iso"


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

#Download SteamOSInstaller.zip
steaminstallfile="SteamOSInstaller.zip"
steaminstallerurl="http://repo.steampowered.com/download/${steaminstallfile}"
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
if unzip -u ${steaminstallfile} -d ${BUILD}; then
	:
else
	echo "Error unzipping ${steaminstallfile} into ${BUILD}!"
	exit 1
fi

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
apt-ftparchive -c ${APTCONF} release ${BUILD}/dists/${DISTNAME} > ${BUILD}/dists/${DISTNAME}/Release

#Replace testing with alchemist
echo "Replacing ${BUILD}/dists/testing"
if [ -d ${BUILD}/dists/testing ]; then
	rm -fr "${BUILD}/dists/testing"
	cp -a ${BUILD}/dists/alchemist ${BUILD}/dists/testing
fi

#gpg --default-key "0E1FAD0C" --output $BUILD/dists/$DISTNAME/Release.gpg -ba $BUILD/dists/$DISTNAME/Release
cd ${BUILD}
find . -type f -print0 | xargs -0 md5sum > md5sum.txt
cd -

#Remove old iso
if [ -f ${ISOPATH}/${ISONAME} ]; then
	rm -f "${ISOPATH}/${ISONAME}"
fi

xorriso -as mkisofs -r -checksum_algorithm_iso md5,sha1,sha256,sha512 \
	-V 'Ye Olde SteamOSe 1.0b1a1' -o ${ISOPATH}/${ISONAME} \
	-J -isohybrid-mbr /usr/lib/syslinux/isohdpfx.bin \
	-J -joliet-long -cache-inodes -b isolinux/isolinux.bin \
	-c isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
	-boot-info-table -eltorito-alt-boot -e boot/grub/efi.img \
	-no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus $BUILD
