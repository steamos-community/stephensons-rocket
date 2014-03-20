-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: lvm2
Binary: lvm2, lvm2-udeb, clvm, libdevmapper-dev, libdevmapper1.02.1, libdevmapper1.02.1-udeb, dmsetup, dmsetup-udeb, libdevmapper-event1.02.1, dmeventd, liblvm2app2.2, liblvm2cmd2.02, liblvm2-dev
Architecture: any
Version: 2.02.95-8+rocket1
Maintainer: Debian LVM Team <pkg-lvm-maintainers@lists.alioth.debian.org>
Uploaders: Bastian Blank <waldi@debian.org>
Homepage: http://sources.redhat.com/lvm2/
Standards-Version: 3.9.1
Vcs-Browser: http://svn.debian.org/wsvn/pkg-lvm/lvm2/trunk/
Vcs-Svn: svn://svn.debian.org/pkg-lvm/lvm2/trunk/
Build-Depends: dpkg-dev (>= 1.16.1~), debhelper (>= 8.1.3~), automake, libcman-dev (>> 2), libcorosync-dev, libdlm-dev (>> 2), libreadline-gplv2-dev, libselinux1-dev, libudev-dev, openais-dev, pkg-config
Package-List: 
 clvm deb admin extra
 dmeventd deb admin optional
 dmsetup deb admin optional
 dmsetup-udeb udeb debian-installer optional
 libdevmapper-dev deb libdevel optional
 libdevmapper-event1.02.1 deb libs optional
 libdevmapper1.02.1 deb libs optional
 libdevmapper1.02.1-udeb udeb debian-installer optional
 liblvm2-dev deb libdevel optional
 liblvm2app2.2 deb libs optional
 liblvm2cmd2.02 deb libs optional
 lvm2 deb admin optional
 lvm2-udeb udeb debian-installer optional
Checksums-Sha1: 
 c0e80708898c4a4eacde8ee811e4cfceceed7155 1164852 lvm2_2.02.95.orig.tar.gz
 b8926be52b6fe40d5a5aadbf1161426aeb414a85 38612 lvm2_2.02.95-8+rocket1.debian.tar.gz
Checksums-Sha256: 
 23675b96bea6b8f4ece728a9a996f4d823bd58055424abaa410548b160ec10b0 1164852 lvm2_2.02.95.orig.tar.gz
 64ec101c10cf35c75d5b3ccbc37a532b9df9afb6dc9fda48fe2e24520146c7a6 38612 lvm2_2.02.95-8+rocket1.debian.tar.gz
Files: 
 dae119ca16495c5475ffe34ce275cae0 1164852 lvm2_2.02.95.orig.tar.gz
 963eb299f263fb06bf6d3f79f5d5dd23 38612 lvm2_2.02.95-8+rocket1.debian.tar.gz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAEBCAAGBQJTK0jGAAoJEMkPnLkOH60MIYgH/A+N4Qlmb6/TZr+/XR9a6rlj
FG1y9J+yeZypNRUM8E3k+6NyOfhzFoRtcyv3tOqq7rLqQYhAhoT5G/lzN1vLd9UJ
UY7OalbQ+pNcEPLMUkxPWrx8p3WD2/odO6l+z+IJBHyfUJ7BnJtUUDP1/tOAiEGO
IHZya0Xd4xBJsEoas1drcPjYLpNrFCqfQ/laT3NvvmyPowuY38gtFJTPJS3WvcHq
XUwR+Y/AWINKOZXU18FlOlpnG5fNSp+67Utk3k/KcKaVHT2AOmrQC/isW5jQ1HXt
F7519j8vdzLME4naR8X1MJhEcwbDlPwXZDVXBN3X7meHouuP+2ZGOUBiC1X9m18=
=xYBb
-----END PGP SIGNATURE-----
