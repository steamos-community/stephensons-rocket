#!/bin/bash

# set variables
distdir="pkg-list"
sources="sources.list"

usage () {
	echo "usage: $0 [ u ] [ -s sources.list ] input-directory [ output-directory]"
	echo "	     -u		update package lists"
	echo "	     -s		load a different sources.list file"
	echo ""
	echo "The input directory is where the packages you want to add to a pool directory are located."
	echo "The output directory is where the target pool directory is located, ${PWD} by default."	
}	


download (){
	if [ -d ${distdir} ] && [[ -z $update ]]; then
		return
	fi
	if [ -d ${distdir} ]; then
		rm -rf ${distdir}
	fi
	mkdir -p ${distdir}
	while read repo; do
	 	# ignore line which don't start with deb
		if [[ "$(echo ${repo}|cut -d" " -f1)" = "deb" ]]; then 
			# get required info from repo string
			repourl=$(echo $repo|cut -d" " -f2)
			reponame=$(echo $repo|cut -d" " -f3)
			repoareas=$(echo $repo|cut -d" " -f4-)
			for area in ${repoareas}; do
				for arch in i386 amd64 all; do
					cd ${distdir}
					url="${repourl}/dists/${reponame}/${area}/binary-${arch}/Packages.gz"
					echo "Downloading ${url}"
					wget -q "${url}"
					if [[ ! $? -eq 0 ]]; then
                                        	echo "Failed"
                                        fi
                                        cd - > /dev/null
                        	done
               	done
        	fi
	done < ${sources}
}

movepkg () {
	package=${1}
	shortname=$(echo ${package}|cut -d"_" -f 1|rev|cut -d "/" -f 1|rev)
	target=$(zgrep -h "/${shortname}_" ${distdir}/Packages.gz*|head -1|cut -d " " -f 2|rev|cut -d "/" -f 2-|rev)
	if [[ -z ${target} ]]; then
		pkgchar=$(echo ${shortname}|cut -c1)
		target="pool/main/${pkgchar}/${shortname}/"
	fi
	mkdir -p ${output}/${target}
	cp ${input}/${package} ${output}/${target}
}

while getopts "us:" opt
do
	case $opt in
		u) 	update=1
		;;
		s)	sources=${OPTARG}
		;;
		*)	usage
		;;
	esac
done
shift $(($OPTIND -1 ))

# read input
if [ $# -eq 2 ];then
	input="$1"
	output="$2"
elif [ $# -eq 1 ]; then
	input="$1"
	output="."
else
	usage
	exit 1
fi

download

for pkg in `ls ${input}|grep 'deb$'`;do
	movepkg $pkg
done
