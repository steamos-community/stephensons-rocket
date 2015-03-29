#!/bin/bash

# This script can move a bunch of deb files from a specified directory into the correct one in pool.
# It currently accepts the options -i, -r and -n.

# Set variables
distdir="package-lists"
architectures="i386 amd64 all"
olderdir="old-versions"

# show how to user ./addtopool.sh
usage ( ) {
	echo "Usage: $0 [ -u ] packageslocation"
	echo "-u 		Update the package lists"
	exit 1
}

# Download all the package list files in the list distfiles
download ( ) {
        if [[ $update -eq 1 ]] || [ ! -d ${distdir} ]; then
                mkdir -p ${distdir}
                while read repo; do
                        # ignore line which don't start with deb
        		if [[ "$(echo ${repo}|cut -d" " -f1)" = "deb" ]]; then 
                        	# get required info from repo string
                        	repourl=$(echo $repo|cut -d" " -f2)
                        	reponame=$(echo $repo|cut -d" " -f3)
                        	repoareas=$(echo $repo|cut -d" " -f4-)
                        	for area in ${repoareas}; do
        	                	for arch in ${architectures}; do
        	                        	packagelist="${repourl}/dists/${reponame}/${area}/binary-${arch}/Packages.gz"
                                        	wget -q -x  -P ${distsdir} "${packagelist}"
                                        	if [[ ! $? -eq 0 ]]; then
                                                	echo " "
                                                	echo "Couldn't download ${packagelist}"
                                                	echo " "
                                        	fi
                                	done
                        	done
              		fi
                done < sources.list
	fi
}

# Move the packages to the pool
move ( ) {
	files=$(ls ${pkgdir}|grep ".*deb"|cut -d"_" -f1,3)
	
	nonuniq=$(echo $files|tr "\ " "\n"|uniq -d)
	
	# compare versions in duplicate packages are found
	if [[ ! -z nonuniq ]]; then
	        mkdir -p ${pkgdir}/${olderdir}
	        for package in ${nonuniq}; do
	                # here it's going to check which file is the newest and move everything
	                searchname=$(echo ${package}|sed 's/_/_*_/g')
	                pkgversions=$(ls ${pkgdir}/${searchname})
	                newest=$(echo ${pkgversions}|tr "\ " "\n"|sort -V|tail -1)
	                pkgversions=$(echo ${pkgversions}|sed "s#${newest}##")
	                for version in ${pkgversions}; do
	                        files==$(echo ${files}|sed "s#${version}##")
	                        mv ${version} ${pkgdir}/${olderdir}
	                        mvdolderdir="${mvdolderdir} ${version}"
	                done
	        done
	fi

        # reset files, otherwise there will still be duplicate entries
        files=$(ls ${pkgdir}|grep ".*deb"|cut -d"_" -f1,3)

        # find out where the package belongs and move it there
        for package in ${files}; do
                found=0
                while read repo; do
                        if [[ ! ${found} -eq 0 ]]; then
                                break
                        fi
                        repourl=$(echo $repo|cut -d" " -f2)
                        reponame=$(echo $repo|cut -d" " -f3)
                        repoareas=$(echo $repo|cut -d" " -f4-)
                        for area in ${repoareas}; do
        	                for arch in ${architectures}; do
        	                        repodir=$(echo ${repourl}|cut -d"/" -f3-)
        	                        packagesfile="${distdir}/${repodir}/dists/${reponame}/${area}/binary-${arch}/Packages.gz"
        	                        
        	                        if [[ -f ${packagesfile} ]] && [[ ${found} -eq 0 ]]; then
        	                                location=$(zgrep "Filename:" ${packagesfile}|cut -d":" -f2-|grep -m 1 $(echo "${package}"|cut -d"_" -f1)|cut -d "/" -f-4)
        	                                if [[ ! -z ${location} ]]; then
        	                                        searchname=$(echo ${package}|sed 's/_/_*_/g')
        	                                        mkdir -p ${location}
        	                                        mv -f ${pkgdir}/${searchname} ${location}
        	                                        mvdpool="${mvdpool} ${package}"
        	                                        found=1
        	                                fi
        	                        fi
        	                done
        	        done
                done < sources.list
        done
}

printresult ( ) {
        mvdpoolnr=$(echo ${mvdpool}|wc -w)
        mvdolderdirnr=$(echo ${mvdolderdir}|wc -w)
        # display the results to the user
        echo " "
        echo "Done!"
        echo " "
        echo "Moved to pool: ${mvdpool}"
        echo " "
        echo "Moved to ${pkgdir}/${olderdir}: ${mvdolderdir}"
        echo " "
        echo "${mvdpoolnr} packages were added to the pool."
        echo "${mvdolderdirnr} packages were move to ${pkgdir}/${olderdir} because a newer version was found in ${pkgdir}."
}
# Setup command line arguments
if [[ $# -eq 0 ]]; then
	usage
fi

while getopts u opt
do
	case $opt in
		u) update=1;;
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
printresult
