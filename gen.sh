#!/bin/sh
BUILD=./buildroot
APTCONF=./ftparchive/apt-ftparchive.conf
DISTNAME=alchemist
ISOPATH=".."
ISONAME="yeolde.iso"

#Check dependencies
deps="apt-utils xorriso syslinux"
for dep in ${deps}; do
	if dpkg-query -s ${dep} >/dev/null 2>&1; then
	        :
	else
		echo "Missing dependency: ${dep}"
		echo "Install with: sudo apt-get install ${dep}"
#		exit 1
	fi
done

echo "Generating Packages.."
apt-ftparchive generate ${APTCONF}
apt-ftparchive -c ${APTCONF} release ${BUILD}/dists/${DISTNAME} > ${BUILD}/dists/${DISTNAME}/Release
rm -fr dists/testing
cp -a dists/alchemist dists/testing

#gpg --default-key "0E1FAD0C" --output $BUILD/dists/$DISTNAME/Release.gpg -ba $BUILD/dists/$DISTNAME/Release
find . -type f -print0 | xargs -0 md5sum > md5sum.txt

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

