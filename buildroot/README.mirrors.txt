                        Debian worldwide mirror sites
                        -----------------------------

Debian is distributed (mirrored) on hundreds of servers on the Internet.
Using a nearby server will probably speed up your download, and also
reduce the load on our central servers and on the Internet as a whole.

Debian mirrors can be primary and secondary. The definitions are as follows:

  A primary mirror site has good bandwidth, is available 24 hours a day,
  and has an easy to remember name of the form ftp.<country>.debian.org.
  They are all automatically updated whenever there are updates to
  the Debian archive.

  A secondary mirror site may have restrictions on what they mirror (due to
  space restrictions). Just because a site is secondary doesn't necessarily
  mean it'll be any slower or less up to date than a primary site.

Use the site closest to you for the fastest downloads possible whether it is
a primary or secondary site. The program `netselect' can be used to
determine the site with the least latency; use a download program such as
`wget' or `rsync' for determining the site with the most throughput.
Note that geographic proximity often isn't the most important factor for
determining which machine will serve you best.

The authoritative copy of the following list can always be found at:
                      http://www.debian.org/mirror/list
If you know of any mirrors that are missing from this list,
please have the site maintainer fill out the form at:
                     http://www.debian.org/mirror/submit
Everything else you want to know about Debian mirrors:
                        http://www.debian.org/mirror/


                         Primary Debian mirror sites
                         ---------------------------

 Country         Site                  Debian archive  Architectures
 ---------------------------------------------------------------------------
 Austria         ftp.at.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Australia       ftp.au.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Bosnia & Herzegovina  ftp.ba.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Belgium         ftp.be.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Bulgaria        ftp.bg.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Brazil          ftp.br.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Belarus         ftp.by.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Canada          ftp.ca.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Switzerland     ftp.ch.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Chile           ftp.cl.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 China           ftp.cn.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Czech Republic  ftp.cz.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390x
 Germany         ftp.de.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Germany         ftp2.de.debian.org    /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Denmark         ftp.dk.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Estonia         ftp.ee.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Spain           ftp.es.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mipsel powerpc s390 sparc
 Finland         ftp.fi.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 France          ftp.fr.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 France          ftp2.fr.debian.org    /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 United Kingdom  ftp.uk.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Greece          ftp.gr.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Hong Kong       ftp.hk.debian.org     /debian/        amd64 i386
 Croatia         ftp.hr.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Hungary         ftp.hu.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Ireland         ftp.ie.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Iceland         ftp.is.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Italy           ftp.it.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Japan           ftp.jp.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Korea           ftp.kr.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Lithuania       ftp.lt.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Mexico          ftp.mx.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 New Caledonia   ftp.nc.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Netherlands     ftp.nl.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Norway          ftp.no.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 New Zealand     ftp.nz.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Poland          ftp.pl.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Portugal        ftp.pt.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Romania         ftp.ro.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Russia          ftp.ru.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Sweden          ftp.se.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Slovenia        ftp.si.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Slovakia        ftp.sk.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 El Salvador     ftp.sv.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Thailand        ftp.th.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Turkey          ftp.tr.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Taiwan          ftp.tw.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 Ukraine         ftp.ua.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
 United States   ftp.us.debian.org     /debian/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc


                   Secondary mirrors of the Debian archive
                   ---------------------------------------

HOST NAME                       FTP                             HTTP                            ARCHITECTURES
---------                       ---                             ----                            -------------

AR Argentina
------------
ftp.ccc.uba.ar                  /pub/linux/debian/debian/       /pub/linux/debian/debian/       amd64 i386
mirrors.dcarsat.com.ar                                          /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

AT Austria
----------
ftp.at.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.sil.at)
gd.tuwien.ac.at                                                 /opsys/linux/debian/            amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mur.at                   /debian/                        /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 powerpc
ftp.tu-graz.ac.at               /mirror/debian/                 /mirror/debian/                 amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.univie.ac.at                /systems/linux/debian/debian/   /systems/linux/debian/debian/   armel
debian.inode.at                 /debian/                        /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 powerpc s390x sparc
debian.lagis.at                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

AU Australia
------------
ftp.au.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (mirror.linux.org.au)
mirror.aarnet.edu.au            /debian/                                                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.monash.edu.au               /pub/linux/debian/              /pub/linux/debian/              amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
mirror.eftel.com                /debian/                        /debian/                        amd64 i386
ftp.iinet.net.au                /debian/debian/                 /debian/debian/                 amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.optus.net                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.cse.unsw.edu.au          /debian/                        /debian/                        amd64 armel armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc s390x
mirror.linux.org.au             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.overthewire.com.au       /debian/                        /debian/                        amd64 i386
mirror.waia.asn.au              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.transact.net.au          /debian/                        /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
debian.mirror.uber.com.au                                       /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.crucial.com.au           /debian/                        /debian/                        amd64 i386

BA Bosnia & Herzegovina
-----------------------
ftp.ba.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (mirror.debian.com.ba)
mirror.debian.com.ba            /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

BD Bangladesh
-------------
mirrors.ispros.com.bd           /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390x

BE Belgium
----------
ftp.be.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (mirror.as35701.net)
ftp.easynet.be                  /debian/                        /ftp/debian/                    amd64 i386
ftp.belnet.be                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.debian.skynet.be            /debian/                        /ftp/debian/                    amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.as35701.net              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
be.mirror.eurid.eu              /debian/                        /debian/                        amd64 armhf i386 s390x

BG Bulgaria
-----------
ftp.bg.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.spnet.net)
debian.spnet.net                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.ludost.net               /debian/                        /debian/                        amd64 i386
ftp.uni-sofia.bg                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.telecoms.bg              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mnet.bg                  /debian/                        /debian/                        armhf i386 s390x
debian.ipacct.com               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

BR Brazil
---------
ftp.br.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.c3sl.ufpr.br)
download.unesp.br                                               /linux/debian/                  amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.c3sl.ufpr.br             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
sft.if.usp.br                                                   /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
linorg.usp.br                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.pucpr.br                    /debian/                                                        amd64 hurd-i386 i386
debian.las.ic.unicamp.br        /debian/                        /debian/                        amd64 i386 powerpc sparc
debian.pop-sc.rnp.br                                            /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
debs.pelotas.ifsul.edu.br       /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

BY Belarus
----------
ftp.by.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.mgts.by)
mirror.datacenter.by            /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

CA Canada
---------
ftp.ca.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.mirror.iweb.ca, ftp3.nrc.ca, debian.mirror.rafal.ca)
debian.yorku.ca                                                 /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
debian.bhs.mirrors.ovh.net      /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp3.nrc.ca                     /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.cpsc.ucalgary.ca         /debian/                        /mirror/debian.org/debian/      amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.peer1.net                                                /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mirror.rafal.ca          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.savoirfairelinux.net     /debian/                        /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 powerpc s390x
debian.mirror.iweb.ca           /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.csclub.uwaterloo.ca      /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.its.dal.ca               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.ece.ubc.ca                                              /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mirror.netelligent.ca    /debian/                        /debian/                        amd64 i386 ia64 kfreebsd-amd64 kfreebsd-i386
deb.vanvps.com                                                  /debian/                        amd64 i386
debian.mirror.gtcomm.net        /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

CH Switzerland
--------------
ftp.ch.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.ethz.ch)
mirror.switch.ch                /mirror/debian/                 /ftp/mirror/debian/             amd64 armel i386 kfreebsd-amd64 kfreebsd-i386 sparc
debian.ethz.ch                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.csg.uzh.ch               /debian/                        /debian/                        amd64 armel armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

CL Chile
--------
ftp.cl.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.netlinux.cl)
debian.utalca.cl                                                /debian/                        amd64 i386
debian.netlinux.cl              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.tecnoera.com                                            /debian/                        amd64 armhf i386 s390x
debian.insacom.cl               /debian/                        /debian/                        amd64 armel i386 kfreebsd-amd64 kfreebsd-i386

CN China
--------
ftp.cn.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.ustc.edu.cn)
www.anheng.com.cn               /debian/                        /debian/                        amd64 armhf i386 kfreebsd-amd64 mips mipsel powerpc
mirrors.163.com                                                 /debian/                        amd64 i386
debian.bjtu.edu.cn              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.ustc.edu.cn              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.sohu.com                /debian/                        /debian/                        amd64 i386

CO Colombia
-----------
debian.unal.edu.co              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.uniminuto.edu                                            /debian/                        amd64 i386

CR Costa Rica
-------------
mirrors.ucr.ac.cr               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

CZ Czech Republic
-----------------
ftp.cz.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390x
  (ftp.debian.cz)
debian.sh.cvut.cz               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.zcu.cz                      /mirrors/debian/                /mirrors/debian/                amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
debian.mirror.web4u.cz          /                               /                               amd64 armel armhf i386 s390x
ftp.cvut.cz                     /debian/                        /debian/                        amd64 armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 s390x
debian.ignum.cz                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mirror.dkm.cz            /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.superhosting.cz          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390x
merlin.fit.vutbr.cz                                             /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 mips

DE Germany
----------
ftp.de.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.inf.tu-dresden.de)
ftp2.de.debian.org              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.halifax.rwth-aachen.de)
ftp.tu-clausthal.de             /pub/linux/debian/              /pub/linux/debian/              amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.uni-duisburg-essen.de    /debian/                        /debian/                        amd64 armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386
ftp.freenet.de                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.uni-erlangen.de             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.informatik.rwth-aachen.de   /pub/Linux/debian/              /ftp/pub/Linux/debian/          amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp-stud.hs-esslingen.de        /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.stw-bonn.de                 /debian/                        /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
ftp.fu-berlin.de                /pub/unix/linux/mirrors/debian/                                 amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.tu-bs.de                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.uni-koeln.de                /debian/                        /debian/                        amd64 armel armhf i386
ftp.mpi-sb.mpg.de               /pub/linux/debian/                                              amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
ftp.tu-chemnitz.de              /pub/linux/debian/debian/       /pub/linux/debian/debian/       amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.uni-kl.de                   /debian/                        /debian/                        amd64 i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc sparc
ftp.uni-bayreuth.de             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.informatik.hu-berlin.de     /pub/Linux/debian/                                              amd64 armel hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc
ftp5.gwdg.de                    /pub/linux/debian/debian/       /pub/linux/debian/debian/       amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.hosteurope.de               /mirror/ftp.debian.org/debian/  /mirror/ftp.debian.org/debian/  amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.informatik.uni-frankfurt.de /pub/Mirrors/debian.org/debian/ /debian/                        amd64 armel armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc s390x
debian.netcologne.de            /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
artfiles.org                    /debian/                        /debian/                        amd64 i386 kfreebsd-amd64 kfreebsd-i386
debian.intergenia.de                                            /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.rrzn.uni-hannover.de        /debian/debian/                                                 amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.plusline.de                 /pub/debian/                    /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.ayous.org                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.halifax.rwth-aachen.de      /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.morphium.info            /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.unitedcolo.de            /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.1und1.de                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.de.leaseweb.net          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mirror.iphh.net          /debian/                        /debian/                        amd64 armel armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x
deb-mirror.de                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mirror.lrz.de            /debian/                        /debian/                        amd64 i386

DK Denmark
----------
ftp.dk.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (mirrors.dotsrc.org)
mirrors.dotsrc.org              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.telianet.dk             /debian/                        /debian/                        amd64 armhf i386 s390x
mirrors.rackhosting.com         /debian/                        /debian/                        amd64 i386 ia64 kfreebsd-amd64 kfreebsd-i386 sparc
debian.skarta.net                                               /debian/                        amd64 i386
mirror.easyspeedy.com           /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

DZ Algeria
----------
debian.usthb.dz                 /debian/                        /debian/                        amd64 i386

EE Estonia
----------
ftp.ee.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.aso.ee)

ES Spain
--------
ftp.es.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mipsel powerpc s390 sparc
  (ulises.hostalia.com)
ftp.rediris.es                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.cica.es                     /debian/                        /debian/                        amd64 armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc s390x
ftp.caliu.cat                   /debian/                        /debian/                        amd64 armel i386 kfreebsd-amd64 kfreebsd-i386
ftp.gva.es                      /mirror/debian/                 /mirror/debian/                 amd64 i386 ia64 kfreebsd-amd64 kfreebsd-i386
ftp.gul.uc3m.es                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.udc.es                      /debian/                        /debian/                        amd64 armel hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc
debian.grn.cat                  /debian/                        /debian/                        amd64 armhf i386 ia64
ftp.cesca.cat                   /debian/                                                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc

FI Finland
----------
ftp.fi.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (trumpetti.atm.tut.fi)
ftp.funet.fi                    /pub/linux/mirrors/debian/      /pub/linux/mirrors/debian/      amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.seclan.com                  /debian/                        /debian/                        amd64 armhf i386 s390x

FR France
---------
ftp.fr.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.proxad.net)
ftp2.fr.debian.org              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.oleane.net)
ftp.iut-bm.univ-fcomte.fr       /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.polytech-lille.fr        /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.proxad.net               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.proxad.net                  /mirrors/ftp.debian.org/        /mirrors/ftp.debian.org/        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.lip6.fr                     /pub/linux/distributions/debian//pub/linux/distributions/debian/amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
debian.ens-cachan.fr            /debian/                        /ftp/debian/                    amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.u-picardie.fr               /mirror/debian/                 /mirror/debian/                 amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mirrors.easynet.fr       /debian/                        /debian/                        amd64 armel armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc s390x sparc
ftp.u-strasbg.fr                /debian/                        /debian/                        amd64 hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc
debian.mirrors.ovh.net          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.nerim.net                   /debian/                        /debian/                        amd64 armhf i386 s390x
ftp.crihan.fr                   /debian/                        /debian/                        amd64 armhf i386 s390x
debian.mines.inpl-nancy.fr      /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.debian.ikoula.com        /debian/                        /debian/                        amd64 i386
webb.ens-cachan.fr              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.ircam.fr                /pub/debian/                    /pub/debian/                    amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.med.univ-tours.fr        /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.univ-pau.fr                 /pub/mirrors/debian/            /linux/mirrors/debian/          amd64 i386
ftp.univ-nantes.fr              /debian/                                                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.compuscene.org          /debian/                        /debian/                        amd64 armel i386
debian.revolsys.fr              /debian/                        /debian/                        amd64 armel i386
debian.univ-reims.fr            /debian/                        /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
debian.advalem.net              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.ec-m.fr                     /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
deb-mir1.naitways.net                                           /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.opensourcemirror.com                                     /debian/                        amd64 armel i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel s390 s390x sparc
debian.univ-tlse2.fr            /debian/                        /debian/                        amd64 armel i386
ftp.rezopole.net                /debian/                        /debian/                        amd64 i386

GB United Kingdom
-----------------
ftp.uk.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (free.hands.com)
free.hands.com                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.man.ac.uk                                                /debian/                        amd64 hurd-i386 i386
mirrorservice.org               /sites/ftp.debian.org/debian/   /sites/ftp.debian.org/debian/   amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.ticklers.org                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.positive-internet.com    /debian/                        /debian/                        amd64 armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc s390x sparc
the.earth.li                    /debian/                        /debian/                        amd64 armel armhf i386 s390x
ukdebian.mirror.anlx.net        /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.ox.ac.uk                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.sov.uk.goscomb.net       /debian/                        /debian/                        amd64 armhf i386 s390x
mirrors.melbourne.co.uk         /debian/                        /debian/                        amd64 hurd-i386 i386
mirror.bytemark.co.uk           /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.stshosting.co.uk         /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.serverspace.co.uk        /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.vorboss.net                                              /debian/                        amd64 armel i386 ia64 powerpc sparc
debian.mirror.uk.sargasso.net                                   /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.mythic-beasts.com                                        /debian/                        amd64 i386

GE Georgia
----------
debian.grena.ge                 /debian/                        /debian/                        amd64 i386

GR Greece
---------
ftp.gr.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.ntua.gr)
debian.otenet.gr                /pub/linux/debian/              /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.cc.uoc.gr                   /mirrors/linux/debian/          /mirrors/linux/debian/          amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

HK Hong Kong
------------
ftp.hk.debian.org               /debian/                        /debian/                        amd64 i386

HR Croatia
----------
ftp.hr.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.carnet.hr)
ftp.irb.hr                      /debian/                        /debian/                        amd64 armhf i386 s390x
ftp.carnet.hr                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.iskon.hr                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.carnet.hr                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

HU Hungary
----------
ftp.hu.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.fsn.hu)
ftp.kfki.hu                     /pub/linux/debian/              /linux/debian/                  amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.fsn.hu                      /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.bme.hu                      /debian/                        /debian/                        amd64 armhf i386 s390x
debian.mirrors.crysys.hu        /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 mips mipsel powerpc s390x
debian.sth.sze.hu               /debian/                        /debian/                        amd64 armhf i386 s390x
ftp.uni-pannon.hu               /debian/                        /debian/                        amd64 armhf i386 ia64 s390x

ID Indonesia
------------
kebo.vlsm.org                   /debian/                        /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
kambing.ui.ac.id                /debian/                        /debian/                        amd64 armel armhf i386 ia64 mips s390x sparc
mirror.unej.ac.id               /debian/                        /debian/                        amd64 armel hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc
suro.ubaya.ac.id                                                /debian/                        amd64 i386
kartolo.sby.datautama.net.id                                    /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

IE Ireland
----------
ftp.ie.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.heanet.ie)
ftp.esat.net                    /pub/linux/debian/              /pub/linux/debian/              amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.heanet.ie                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

IL Israel
---------
debian.co.il                                                    /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
mirror.isoc.org.il                                              /pub/debian/                    amd64 i386

IN India
--------
ftp.iitm.ac.in                  /debian/                        /debian/                        amd64 i386 kfreebsd-amd64 kfreebsd-i386 sparc
mirror.cse.iitk.ac.in           /debian/                        /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
debianmirror.nkn.in                                             /debian/                        amd64 armhf i386
debian.mirror.net.in                                            /debian/                        amd64 armel armhf i386

IR Iran, Islamic Republic of
----------------------------
mordad.iranrepo.ir                                              /debian/                        amd64 i386

IS Iceland
----------
ftp.is.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.simnet.is)
ftp.rhnet.is                    /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.simnet.is                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

IT Italy
--------
ftp.it.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.bofh.it)
giano.com.dist.unige.it         /debian/                        /debian/                        amd64 i386
freedom.dicea.unifi.it          /pub/linux/debian/              /ftp/pub/linux/debian/          amd64 i386
mi.mirror.garr.it               /mirrors/debian/                /mirrors/debian/                amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.fastweb.it               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.fastbull.org             /debian/                        /debian/                        amd64 armhf i386 powerpc s390x
debian.dynamica.it              /debian/                        /debian/                        amd64 armel armhf i386 powerpc s390x
mirror.units.it                                                 /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386
debian.bononia.it               /debian/                        /debian/                        amd64 armel armhf i386 powerpc s390x

JP Japan
--------
ftp.jp.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (dennou-q.gfd-dennou.org, dennou-k.gfd-dennou.org, dennou-h.gfd-dennou.org, www.oyu-net.jp, hanzubon.jp, ftp.nara.wide.ad.jp)
ftp.nara.wide.ad.jp             /debian/                        /debian/                        amd64 armel hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc
ftp.dti.ad.jp                   /pub/Linux/debian/              /pub/Linux/debian/              amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
dennou-k.gfd-dennou.org         /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
dennou-q.gfd-dennou.org         /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.riken.jp                    /Linux/debian/debian/           /Linux/debian/debian/           amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.jaist.ac.jp                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
dennou-h.gfd-dennou.org         /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.tsukuba.wide.ad.jp                                          /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

KE Kenya
--------
debian.mirror.ac.ke             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

KR Korea
--------
ftp.kr.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.kaist.ac.kr)
ftp.daum.net                    /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.lecl.net                    /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.neowiz.com                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

KZ Kazakhstan
-------------
mirror.neolabs.kz               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.network.kz               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

LT Lithuania
------------
ftp.lt.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.mirror.vu.lt)
ftp.litnet.lt                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.balt.net                 /debian/                        /debian/                        amd64 i386
debian.mirror.vu.lt             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

LU Luxembourg
-------------
debian.mirror.root.lu           /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

LV Latvia
---------
debian.koyanet.lv               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.linux.edu.lv             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

MD Moldova
----------
debian.md                       /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc

MK Macedonia
------------
debian.cabletel.com.mk                                          /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x

MX Mexico
---------
ftp.mx.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.unam.mx)
mmc.geofisica.unam.mx           /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

MY Malaysia
-----------
archive.mmu.edu.my                                              /debian/                        amd64 i386

NC New Caledonia
----------------
ftp.nc.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.nautile.nc)
debian.nautile.nc               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

NI Nicaragua
------------
debian.uni.edu.ni                                               /debian/                        amd64 i386

NL Netherlands
--------------
ftp.nl.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.snt.utwente.nl)
ftp.nluug.nl                    /pub/os/Linux/distr/debian/     /pub/os/Linux/distr/debian/     amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.surfnet.nl                  /pub/os/Linux/distr/debian/     /os/Linux/distr/debian/         amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.debian.nl                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.proserve.nl              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.tiscali.nl                  /pub/mirrors/debian/            /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mirror.cambrium.nl       /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
nl.mirror.eurid.eu              /debian/                        /debian/                        amd64 armhf i386 s390x
debian.mirror.evertje.net                                       /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
mirror.nl.leaseweb.net          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.i3d.net                  /debian/                        /pub/debian/                    amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.1000mbps.com             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

NO Norway
---------
ftp.no.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.uninett.no)

NZ New Zealand
--------------
ftp.nz.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.citylink.co.nz)
ftp.citylink.co.nz              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.ihug.co.nz               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

PF French Polynesia
-------------------
repository.linux.pf             /debian/                        /debian/                        amd64 armhf hurd-i386 i386 kfreebsd-amd64 kfreebsd-i386 powerpc s390x

PH Philippines
--------------
mirror.pregi.net                /debian/                        /debian/                        amd64 i386

PL Poland
---------
ftp.pl.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.task.gda.pl)
ftp.task.gda.pl                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.inhost.pro                                               /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.icm.edu.pl                  /pub/Linux/debian/              /pub/Linux/debian/              amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.man.szczecin.pl             /pub/Linux/debian/                                              amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.vectranet.pl                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.pwr.wroc.pl                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.man.poznan.pl               /pub/linux/debian/debian/       /pub/linux/debian/debian/       amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

PT Portugal
-----------
ftp.pt.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.uevora.pt)
ftp.eq.uc.pt                    /pub/software/Linux/debian/     /software/Linux/debian/         amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.ua.pt                    /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.nfsi.pt                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.fe.up.pt                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
cesium.di.uminho.pt             /pub/debian/                    /pub/debian/                    amd64 i386
debian.netvisao.pt              /debian/                        /                               amd64 i386
debian.dcc.fc.up.pt                                             /debian/                        amd64 i386 ia64 powerpc

RO Romania
----------
ftp.ro.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.iasi.roedu.net)
ftp.iasi.roedu.net              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.lug.ro                      /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390x sparc
mirrors.xservers.ro             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.serverhost.ro                                           /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x

RU Russia
---------
ftp.ru.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (mirror.mephi.ru)
debian.nsu.ru                   /debian/                        /debian/                        amd64 i386
ftp.psn.ru                      /debian/                        /debian/                        amd64 armel hurd-i386 i386
ftp.corbina.net                 /debian/                                                        amd64 i386 ia64
ftp.mipt.ru                     /debian/                                                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.yandex.ru                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.debian.chuvsu.ru            /debian/                        /debian/                        amd64 i386
mirror2.corbina.ru              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.mephi.ru                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

SE Sweden
---------
ftp.se.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.acc.umu.se)
ftp.sunet.se                    /pub/Linux/distributions/debian//pub/Linux/distributions/debian/amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.acc.umu.se                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.availo.se                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.ds.karen.hj.se              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.bsnet.se                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.lth.se                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.df.lth.se                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

SG Singapore
------------
mirror.nus.edu.sg                                               /Debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
mirror.0x.sg                    /debian/                        /debian/                        amd64 armel armhf i386 mips

SI Slovenia
-----------
ftp.si.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debmirror.amis.net)
ftp.arnes.si                    /packages/debian/               /pub/packages/debian/           amd64 hurd-i386 i386 kfreebsd-amd64 kfreebsd-i386
debmirror.amis.net              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

SK Slovakia
-----------
ftp.sk.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.debian.sk)
ftp.debian.sk                   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.antik.sk                    /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

SV El Salvador
--------------
ftp.sv.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.salud.gob.sv)
debian.ues.edu.sv                                               /debian/                        amd64 i386 ia64 s390x
debian.salud.gob.sv             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

TH Thailand
-----------
ftp.th.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp.coe.psu.ac.th)
ftp.debianclub.org              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.kku.ac.th                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

TJ Tajikistan
-------------
mirrors.eastera.tj                                              /debian/                        amd64 armhf i386 s390x

TN Tunisia
----------
debian.mirror.tn                                                /debian/                        amd64 armel i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc

TR Turkey
---------
ftp.tr.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.lyildirim.net)
ftp.linux.org.tr                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
russell.cs.bilgi.edu.tr         /debian/                        /debian/                        amd64 hurd-i386 i386
debian.comu.edu.tr              /debian/                        /debian/                        amd64 i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc sparc
ftp.metu.edu.tr                 /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.gnu.gen.tr               /debian/                        /debian/                        amd64 i386
debian.doratelekom.com                                          /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

TW Taiwan
---------
ftp.tw.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.linux.org.tw)
debian.csie.ntu.edu.tw          /pub/debian/                    /debian/                        amd64 i386
opensource.nchc.org.tw          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.isu.edu.tw                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.nctu.edu.tw              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.nttu.edu.tw              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.csie.nctu.edu.tw         /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.ncnu.edu.tw                 /debian/                        /debian/                        amd64 i386 kfreebsd-amd64 kfreebsd-i386 powerpc
ftp.cse.yzu.edu.tw              /pub/Linux/debian/debian/       /pub/Linux/debian/debian/       amd64 armel i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc
ftp.tku.edu.tw                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
shadow.ind.ntou.edu.tw          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

UA Ukraine
----------
ftp.ua.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (debian.org.ua)
debian.osdn.org.ua              /pub/Debian/debian/             /debian/                        amd64 armhf i386 s390x
mirror.mirohost.net             /debian/                        /debian/                        amd64 armhf i386 s390x
ftp2.debian.org.ua              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.volia.net                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

US United States
----------------
ftp.us.debian.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (mirrors.kernel.org, debian.osuosl.org, debian.lcs.mit.edu, mirror.mycre.ws, debian.gtisc.gatech.edu)
ftp.gtlib.gatech.edu            /pub/debian/                    /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp-mirror.internap.com         /pub/debian/                    /pub/debian/                    amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp.uwsg.indiana.edu            /linux/debian/                  /linux/debian/                  amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.uchicago.edu             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
carroll.aset.psu.edu            /pub/linux/distributions/debian//pub/linux/distributions/debian/amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
gladiator.real-time.com         /linux/debian/                                                  amd64 i386 kfreebsd-amd64 kfreebsd-i386
mirrors.kernel.org              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.xmission.com            /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.lug.udel.edu             /pub/debian/                    /pub/debian/                    amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.lcs.mit.edu              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.osuosl.org               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
  (ftp-nyc.osuosl.org, ftp-chi.osuosl.org)
ftp-nyc.osuosl.org              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
ftp-chi.osuosl.org              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.anl.gov                  /pub/debian/                    /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.usc.edu                 /pub/linux/distributions/debian//pub/linux/distributions/debian/amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
lug.mtu.edu                     /debian/                        /debian/                        amd64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390x sparc
debian.mirrors.tds.net          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.cites.illinois.edu       /pub/debian/                    /pub/debian/                    amd64 i386
mirrors.tummy.com               /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.mirror.frontiernet.net   /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.cc.columbia.edu          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.xenir.com                                               /debian/                        amd64 armel armhf hurd-i386 i386 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390x
debian.mirrors.easynews.com                                     /linux/debian/                  amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.acm.jhu.edu                                             /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.steadfast.net                                            /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
ftp.utexas.edu                                                  /debian/                        amd64 armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390x sparc
mirror.fdcservers.net           /debian/                        /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 s390x
mirror.rit.edu                  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.corenetworks.net                                         /debian/                        amd64 i386
debian.cs.binghamton.edu        /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.hmc.edu                                                  /debian/                        amd64 armhf i386 kfreebsd-amd64 kfreebsd-i386 powerpc s390x
mirror.ancl.hawaii.edu          /linux/debian/                  /linux/debian/                  amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.modwest.com                                             /debian/                        amd64 i386
mirrors.bloomu.edu              /debian/                        /debian/                        amd64 armel armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 powerpc
debian.usu.edu                                                  /debian/                        amd64 armel armhf i386 powerpc s390x sparc
debian.securedservers.com                                       /debian/                        amd64 armhf i386 s390x
debian.cc.lehigh.edu                                            /debian/                        amd64 i386
debian.gtisc.gatech.edu         /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.accretive-networks.net  /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.us.leaseweb.net          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.ec.as6453.net            /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.gigenet.com                                             /debian/                        amd64 armhf i386 s390x
noodle.portalus.net             /debian/                        /debian/                        i386
mirrors.syringanetworks.net     /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.liquidweb.com                                           /debian/                        amd64 i386
mirror.cogentco.com             /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.picosecond.org           /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mipsel powerpc s390 sparc
debian.mirror.constant.com                                      /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirrors.advancedhosters.com     /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.thelinuxfix.com          /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
debian.cse.msu.edu              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
mirror.nexcess.net              /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

UZ Uzbekistan
-------------
debian.stream.uz                /debian/                        /debian/                        amd64 armel armhf hurd-i386 i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc

VE Venezuela
------------
debian.unesr.edu.ve                                             /debian/                        amd64 i386

VN Viet Nam
-----------
mirror.debian.vn                                                /debian/                        amd64 i386

VU Vanuatu
----------
debian.telsatbb.vu              /debian/                        /debian/                        amd64 i386

ZA South Africa
---------------
debian.mirror.ac.za             /debian/                        /debian/                        amd64 armhf i386 ia64 s390x
ftp.is.co.za                    /debian/                                                        amd64 armel hurd-i386 i386 ia64 mips mipsel powerpc s390 sparc
debian.mirror.neology.co.za     /debian/                        /debian/                        amd64 i386

-------------------------------------------------------------------------------
Last modified: Sun Sep 22 13:52:10 2013             Number of sites listed: 536
