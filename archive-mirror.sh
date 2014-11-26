#!/bin/sh
#This script will download the SteamOS repo into the archive-mirror directory

# Check if the required dependencies are installed
deps ( ) {
	#Check dependencies
	deps="debmirror"
	for dep in ${deps}; do
		if dpkg-query -s ${dep} >/dev/null 2>&1; then
			:
		else
			echo "Missing dependency: ${dep}"
			echo "Install with: sudo apt-get install ${dep}"
			exit 1
		fi
	done
	if test "`expr length \"$ISOVNAME\"`" -gt "32"; then
		echo "Volume ID is more than 32 characters: ${ISOVNAME}"
		exit 1
	fi
}

deps
mkdir -p archive-mirror/
debmirror -p --nosource --keyring=${PWD}/valve-archive-keyring.gpg \
	--rsync-extra=none -s main,contrib,non-free,main/debian-installer -a amd64,i386 -v \
	-d alchemist,alchemist_beta --method=http -h repo.steampowered.com -r steamos archive-mirror/
