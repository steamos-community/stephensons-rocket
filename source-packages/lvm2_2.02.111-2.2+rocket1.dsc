-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: lvm2
Binary: lvm2, lvm2-udeb, clvm, libdevmapper-dev, libdevmapper1.02.1, libdevmapper1.02.1-udeb, dmsetup, dmsetup-udeb, libdevmapper-event1.02.1, dmeventd, liblvm2app2.2, liblvm2cmd2.02, liblvm2-dev
Architecture: any
Version: 2.02.111-2.2+rocket1
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
 41b2ef0b4f442f698789a9495e36f3cd59713447 29524 lvm2_2.02.111-2.2+rocket1.debian.tar.xz
Checksums-Sha256:
 ff358054ee821503ada8a33b327688cd4d64a2fc448c667a85c332c545aae4f6 1497626 lvm2_2.02.111.orig.tar.gz
 2be8f0277b8511da6f9e368766a45834883da52a91ead8d5327a398fff0310ec 29524 lvm2_2.02.111-2.2+rocket1.debian.tar.xz
Files:
 fb748f698e52a6f5eb8db69ef965824d 1497626 lvm2_2.02.111.orig.tar.gz
 7b5e370f963f911359b0636cd5d25e6d 29524 lvm2_2.02.111-2.2+rocket1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCAAGBQJVjYrdAAoJEMkPnLkOH60MD2EIAKoTbh1c+AxuBel0G1Cakt+V
gFZZg5GZDYzXl5tnnRGZaIiBjfM64VoVGJst0H07AUjHB/UmsKWAWs06WdtCK3YC
Dv1kwTGdQmDKZCYsm56WUFDJpDYp9hEFXmUl1ah124O4MvUHsdEqimr822xJ/V/3
yFRS1cWd5v33H2iZbPq+2KxQB31VgWb8IxSCPrMhKL2xPPAOYoeHeFhCKFXZBPDI
r67y/s1a43EhgKYRwd4XAIN33+YKkUlsapV6J/skZC/SdD1Vdrx6Sg38tr5UZD0f
aLkJnHnaxwhzOR1YXRl+ILIip5WVZfA9+NqeNZe0jJeYBwVUAhacOZEqQD6a2y4=
=ITTJ
-----END PGP SIGNATURE-----
