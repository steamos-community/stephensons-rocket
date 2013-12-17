#!/bin/sh
BUILD=/home/directhex/Projects/SteamOS/buildroot
APTCONF=/home/directhex/Projects/SteamOS/ftparchive/release.conf
DISTNAME=alchemist

apt-ftparchive -c $APTCONF generate /home/directhex/Projects/SteamOS/ftparchive/apt-ftparchive-main.conf
apt-ftparchive -c $APTCONF generate /home/directhex/Projects/SteamOS/ftparchive/apt-ftparchive-contrib.conf
apt-ftparchive -c $APTCONF release $BUILD/dists/$DISTNAME > $BUILD/dists/$DISTNAME/Release
rm -fr dists/testing
cp -a dists/alchemist dists/testing

#gpg --default-key "0E1FAD0C" --output $BUILD/dists/$DISTNAME/Release.gpg -ba $BUILD/dists/$DISTNAME/Release
find . -type f -print0 | xargs -0 md5sum > md5sum.txt

rm -f ../yeolde.iso
xorriso -as mkisofs -r -checksum_algorithm_iso md5,sha1,sha256,sha512 \
	-V 'Ye Olde SteamOSe 1.0b1a1' -o ../yeolde.iso \
	-J -isohybrid-mbr /usr/lib/syslinux/isohdpfx.bin \
	-J -joliet-long -cache-inodes -b isolinux/isolinux.bin \
	-c isolinux/boot.cat -no-emul-boot -boot-load-size 4 \
	-boot-info-table -eltorito-alt-boot -e boot/grub/efi.img \
	-no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus $BUILD

