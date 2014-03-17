#!/bin/sh
mkdir -p archive-mirror/
debmirror -p --nosource --keyring=/usr/share/keyrings/valve-archive-keyring.gpg \
	--rsync-extra=none -s main,contrib,non-free,main/debian-installer -a amd64,i386 -v \
	-d alchemist --method=http -h repo.steampowered.com -r steamos archive-mirror/
