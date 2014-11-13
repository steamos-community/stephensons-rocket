#!/bin/sh
mkdir -p archive-mirror/
debmirror -p --nosource --keyring=./valve-archive-keyring.gpg \
	--rsync-extra=none -s main,contrib,non-free,main/debian-installer -a amd64,i386 -v \
	-d alchemist,alchemist_beta --method=http -h repo.steampowered.com -r steamos archive-mirror/
