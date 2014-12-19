#!/bin/bash

# This script can move a bunch of deb files from a specified directory into the correct one in pool.
# It currently accepts the options -i, -r and -n.

# Set variables
distdir="package-list"
distfiles="http://repo.steampowered.com/steamos/dists/alchemist/main/binary-i386/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist/main/binary-amd64/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist/contrib/binary-i386/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist/contrib/binary-amd64/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist/non-free/binary-i386/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist/non-free/binary-amd64/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist_beta/main/binary-i386/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist_beta/main/binary-amd64/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist_beta/contrib/binary-i386/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist_beta/contrib/binary-amd64/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist_beta/non-free/binary-i386/Packages.gz \
	http://repo.steampowered.com/steamos/dists/alchemist_beta/non-free/binary-amd64/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/main/binary-all/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/main/binary-i386/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/main/binary-amd64/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/contrib/binary-all/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/contrib/binary-i386/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/contrib/binary-amd64/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/non-free/binary-all/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/non-free/binary-i386/Packages.gz \
	http://ftp.debian.org/debian/dists/wheezy/non-free/binary-amd64/Packages.gz "

# show how to user ./addtopool.sh
usage ( ) {
	echo "Usage: $0 [ -r ] [ -i ] [ -n ] packageslocation"
	echo "-u 		Update the package lists"
	echo "-i		Ignore versions of packages"
	echo "-n		Create new directories, when the package isn't found in any of the repos"
	exit 1
}

# Download all the package list files in the list distfiles
download ( ) {
	if [[ $update -eq 1 ]] || [ ! -d ${distdir} ]; then
		mkdir -p ${distdir}
		distnumber=1
		for pkglist in ${distfiles};do
			wget -P ${distdir} ${pkglist}
			distfilename=$(echo $pkglist|rev|cut -d"/" -f1|rev)
			gunzip -c ${distdir}/${distfilename}|grep Filename|cut -d" " -f2 > ${distdir}/files${distnumber}.txt
			rm ${distdir}/${distfilename}
			distnumber=$(($distnumber+1))
		done
	fi
}

# Move the packages to the pool
move ( ) {
	files=$(ls ${pkgdir}|grep ".deb")

	for package in ${files}; do
		# Set new location
		if [[ $ignoreversions -eq 1 ]]; then
			location=$(cat ${distdir}/files*.txt|grep -m 1 $(echo "${package}"|cut -d"_" -f1)|cut -d "/" -f-4)
		else
			location=$(cat ${distdir}/files*.txt|grep -m 1 ${package}|cut -d "/" -f-4)
		fi
		if [[ -z ${location} ]]; then
			# When no potential location has been found
			echo "Couldn't find ${package} in any of the repos"
		fi
		if [[ $newpkgs -eq 1 ]] && [[ -z ${location} ]]; then
			# Force new location if not set and the -n flag has been used
			if [[ "$(echo ${package}|cut -c-3)" == "lib" ]]; then
				ldir1=$(echo ${package}|cut -c-4)
				ldir2=$(echo ${package}|cut -d"_" -f1)
			else
				ldir1=$(echo ${package}|cut -c-1)
				ldir2=$(echo ${package}|cut -d"_" -f1)
			fi
			location="pool/main/${ldir1}/${ldir2}"
			echo "Creating and moving ${package} to directory ${location} anyway"
		fi
		if [[ ${location} ]]; then
			# Make the directory and move the file it it
			mkdir -p ${location}
			mv ${pkgdir}/${package} ${location}
		fi
done

echo "Done! If any packages have been moved, you can find them in ${PWD}/pool"
}

# Setup command line arguments
if [[ $# -eq 0 ]]; then
	usage
fi

while getopts uin opt
do
	case $opt in
		u) update=1;;
		i) ignoreversions=1;;
		n) newpkgs=1;;
		*)usage;;
	esac
done

shift $(($OPTIND -1 ))

# Make sure only one directory is entered
if [ ! -z $2 ]; then
	echo "To many arguments"
	usage
fi

# Set the packageslocation to whatever the user entered
pkgdir=$1

# Check if the directory actually exists
if [ ! -d ${pkgdir} ]; then
	echo "No directory called ${pkgdir} exists"
	usage
fi

# Actually do stuff
download
move
