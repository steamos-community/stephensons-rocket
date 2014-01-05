#!/bin/sh
BUILD=./buildroot
APTCONF=./ftparchive/apt-ftparchive.conf
APTUDEBCONF=./ftparchive/apt-ftparchive-udeb.conf
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

#Make sure our BUILD dir exists
if [ ! -d ${BUILD} ]; then
	mkdir -p ${BUILD}
fi

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

#Delete 32-bit udebs and d-i, as SteamOS is 64-bit only
#TODO: delete entirely needless binary packages too, maybe we can fit on a CD
echo "Deleting 32-bit garbage from ${BUILD}..."
find ${BUILD} -name "*_i386.udeb" -type f -exec rm -rf {} \;
find ${BUILD} -name "*_i386.deb" | egrep -v "(\/eglibc\/|\/elfutils\/|\/expat\/|\/fglrx-driver\/|\/gcc-4.7\/|\/libdrm\/|\/libffi\/|\/libpciaccess\/|\/libvdpau\/|\/libx11\/|\/libxau\/|\/libxcb\/|\/libxdamage\/|\/libxdmcp\/|\/libxext\/|\/libxfixes\/|\/libxxf86vm\/|\/llvm-toolchain-3.3\/|\/mesa\/|\/nvidia-graphics-drivers\/|\/s2tc\/|\/zlib\/)" | xargs rm -f
rm -fr "${BUILD}/install.386"
rm -fr "${BUILD}/dists/*/main/debian-installer/binary-i386/"

#Copy over updated and added debs
#First remove uneeded debs
debstoremove="pool/non-free/f/firmware-nonfree/firmware-linux-nonfree_0.36+wheezy.1+bsos12_all.deb pool/non-free/f/firmware-nonfree/firmware-realtek_0.36+wheezy.1+bsos12_all.deb pool/main/d/debootstrap/debootstrap_1.0.54.steamos+bsos6_all.deb pool/main/d/debootstrap/debootstrap-udeb_1.0.54.steamos+bsos6_all.udeb"
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
apt-ftparchive generate ${APTUDEBCONF}
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

echo "Building ${ISOPATH}/${ISONAME} ..."
xorriso -as mkisofs -r -checksum_algorithm_iso md5,sha1,sha256,sha512 \
	-V 'YeOldeSteamOSe 2013-12-19 Beta2' -o ${ISOPATH}/${ISONAME} \
	-J -isohybrid-mbr /usr/lib/syslinux/isohdpfx.bin \
	-joliet-long -b isolinux/isolinux.bin \
	-c isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
	-boot-info-table -eltorito-alt-boot -e boot/grub/efi.img \
	-no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus ${BUILD}
