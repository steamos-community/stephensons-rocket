-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: lvm2
Binary: lvm2, lvm2-udeb, clvm, libdevmapper-dev, libdevmapper1.02.1, libdevmapper1.02.1-udeb, dmsetup, dmsetup-udeb, libdevmapper-event1.02.1, dmeventd, liblvm2app2.2, liblvm2cmd2.02, liblvm2-dev
Architecture: any
Version: 2.02.111-2.2+rocket2
Maintainer: Debian LVM Team <pkg-lvm-maintainers@lists.alioth.debian.org>
Uploaders: Bastian Blank <waldi@debian.org>
Homepage: http://sources.redhat.com/lvm2/
Standards-Version: 3.9.5
Vcs-Browser: http://svn.debian.org/wsvn/pkg-lvm/lvm2/trunk/
Vcs-Svn: svn://svn.debian.org/pkg-lvm/lvm2/trunk/
Build-Depends: dpkg-dev (>= 1.16.1~), debhelper (>= 8.1.3~), dh-systemd, automake, libcman-dev (>> 2), libcorosync-dev, libdlm-dev (>> 2), libreadline-gplv2-dev, libselinux1-dev, libudev-dev, openais-dev, pkg-config
Package-List:
 clvm deb admin extra arch=any
 dmeventd deb admin optional arch=any
 dmsetup deb admin optional arch=any
 dmsetup-udeb udeb debian-installer optional arch=any
 libdevmapper-dev deb libdevel optional arch=any
 libdevmapper-event1.02.1 deb libs optional arch=any
 libdevmapper1.02.1 deb libs optional arch=any
 libdevmapper1.02.1-udeb udeb debian-installer optional arch=any
 liblvm2-dev deb libdevel optional arch=any
 liblvm2app2.2 deb libs optional arch=any
 liblvm2cmd2.02 deb libs optional arch=any
 lvm2 deb admin optional arch=any
 lvm2-udeb udeb debian-installer optional arch=any
Checksums-Sha1:
 ac0a93053ca09f4cd27a1569fad5085a1cce4445 1497626 lvm2_2.02.111.orig.tar.gz
 68b0b94c7228ffd87bc7d04371b5616d02ac07dc 29540 lvm2_2.02.111-2.2+rocket2.debian.tar.xz
Checksums-Sha256:
 ff358054ee821503ada8a33b327688cd4d64a2fc448c667a85c332c545aae4f6 1497626 lvm2_2.02.111.orig.tar.gz
 7df9a6e35fe84773d03e880f4e7b6f3eaac472c58ee7e459d5d8938e1280c34e 29540 lvm2_2.02.111-2.2+rocket2.debian.tar.xz
Files:
 fb748f698e52a6f5eb8db69ef965824d 1497626 lvm2_2.02.111.orig.tar.gz
 c8a09e7dd86822eb4562172fdf83a937 29540 lvm2_2.02.111-2.2+rocket2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCAAGBQJVpZsMAAoJEMkPnLkOH60MOXcH/iOO7R/dVVcHjym7l4WxgMY4
OGMjntADu8ik+Y3JbqvCQvydJbF/PW76z2AiKDFEoPRoBLYdAfG+/7XaFQHoTyYL
jqpL/miVyjRuD61IioKR1zj9IMpidC7YQ7RAqtYfLSpm8a5YEy2nQ+9Dfr8QTaIx
1dciWnc2uasmHimNMxUIcrkEg2AxJ6fGEENxCjlWNB9pDt2bEhF2gnGA91pRK+c4
QpKXr5HJ3HHWLrkX3FXQcArTcOEo8zSBIGbEqHVVCUz15GSVRr9/Vwa6abaNReBK
dfgNLr/MQwO1/Q7AlhfolMIk6TV5qVTqJmf7TyB//zR2V8kEWVUawCnYR+RX4cc=
=nqAs
-----END PGP SIGNATURE-----
