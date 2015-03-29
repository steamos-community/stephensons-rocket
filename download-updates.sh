#!/bin/bash

# This script is used for downloading package updates.
# The configuration file with repos is called sources.list, which works in almost the same way as the sources.list file in debian.
# Adding main/debian-installer to a line with a repo will make it look for installer updates as well.
# Packages are downloaded to the updates directory.

# set variables
architectures="amd64 i386 all"
distsdir="package-lists"
downloaddir="updates"

buildroottextfile="${distsdir}/buildroot.txt"
repotextfile="${distsdir}/repo.txt"

# create download dir
mkdir -p ${downloaddir}
mkdir -p ${distsdir}
    
# this loop reads sources.list  
while read repo; do
        # ignore line if empty or starting with #
        if [[ "$(echo ${repo}|cut -d" " -f1)" = "deb" ]]; then        
        	# get required info from repo string
        	repourl=$(echo $repo|cut -d" " -f2)
        	reponame=$(echo $repo|cut -d" " -f3)
        	repoareas=$(echo $repo|cut -d" " -f4-)
        
        	# check each part of the repo
        	for area in ${repoareas}; do
        		for arch in ${architectures}; do
        			# download repo packagelist
        			packagelist="${repourl}/dists/${reponame}/${area}/binary-${arch}/Packages.gz"
        			wget -q -x  -P ${distsdir} "${packagelist}"
        			if [[ ! $? -eq 0 ]]; then
        		        	echo "Couldn't download ${packagelist}"
        		        	echo " "
        		        	break
        			fi
        			packagelist=$(echo ${packagelist}|cut -d"/" -f3-)
        		
        			# use amd64 as arch for the buildroot when all is the current arch
        			# this because SteamOS iso has no Package.gz for all, instead all has been merged into amd64 
        			if [[ "${arch}" = "all" ]]; then
        		        	steamosarch="amd64"
        			else
        		        	steamosarch="${arch}"
        			fi
        		
        			# copy the filename strings from the Package.gz from both the local buildroot and the repo into textfiles
        			gunzip -c buildroot/dists/alchemist/${area}/binary-${steamosarch}/Packages.gz|grep Filename|cut -d" " -f2|sort > ${buildroottextfile}
        			gunzip -c ${distsdir}/${packagelist}|grep Filename|cut -d" " -f2|sort > ${repotextfile}
                        
        			# create a list of packages which have different versions in the repo than the ones in the buildroot
        			diffpkgs=$(grep -F "`cat ${buildroottextfile}|cut -d'_' -f1|sed 's/$/_/g'`" ${repotextfile}|grep -Fvxf "${buildroottextfile}")
                        
        			# download all the new packages
        			for pkg in ${diffpkgs}; do
        				pkgname=$(echo "${pkg}"|cut -d"_" -f1)
        				oldpkg=$(grep "${pkgname}" ${buildroottextfile})
        				endofname=$(echo ${pkg}|cut -d "_" -f3)
        				newestpkg=$(echo -e "${pkg}\n${oldpkg}"|cut -d"_" -f1-2|sort -V|sed "s/\$/_${endofname}/g"|tail -1)
        				if [[ ! -z ${oldpkg} ]] && [[ "x${pkg}" == "x${newestpkg}" ]]; then
        			        	if [[ -z $(echo "${downloaded}"|grep ${pkg}) ]]; then
        				        	echo "buildroot: ${oldpkg}"
        				        	echo "repo: ${pkg}"
        				
        				        	downloaded="${downloaded} ${pkg}"
                                	        	wget -nc -nv -P ${downloaddir} ${repourl}/${pkg}
                                	        	echo " "
                                		fi
                                	else
                                        	if [[ -z $(echo "${skipped}"|grep ${pkg}) ]];then
                                	        	skipped="${skipped} ${pkg}"
                                		fi
                                	fi
        			done
                         
        			# clean up
        			rm ${buildroottextfile}
        			rm ${repotextfile}
        		done
        	done
        fi
        
# throw sources.list into the while loop        
done < sources.list

while getopts s opt
do
	case $opt in
		s) showskipped=1;;
		*)usage;;
	esac
done

usage ( ) {
        echo "Usage: $0 [ -s ]"
	echo "-s 		Show packages which were skipped because they are older than what's in the pool"
	exit 1
}

# calculate results
downloadednr=$(echo "${downloaded}"|wc -w)
skippednr=$(echo "${skipped}"|wc -w)

# output result
echo "Downloaded packages: ${downloaded}"
echo " "
echo "${downloadednr} package have been downloaded"

if [[ ! -z ${showskipped} ]];then
        echo " "
        echo "Skipped packages: ${skipped}"
        echo " "
        echo "${skippednr} packages have been skipped"
fi

echo " "
echo "Downloaded packages are moved to ${downloaddir}. To add them to the pool run: ./addtopool.sh ${downloaddir}"
