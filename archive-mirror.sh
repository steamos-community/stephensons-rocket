#!/bin/sh
#This script will download the SteamOS repo into the archive-mirror directory

# Check if the required dependencies are installed
deps ( ) {
	#Check dependencies
	deps="apt-mirror"
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

# Create config file
cat > mirror.list << EOF
 set base_path    ${PWD}/archive-mirror
set nthreads     20
set _tilde 0
deb http://repo.steampowered.com/steamos alchemist main contrib non-free
deb http://repo.steampowered.com/steamos alchemist_beta main contrib non-free
clean http://repo.steampowered.com/steamos
EOF

mkdir -p archive-mirror/

apt-mirror mirror.list

rm mirror.list
