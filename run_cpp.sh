#!/usr/bin/bash

# Cpp program build and run
# Author: Md Musleh Uddin
# Created at: Aug 17, 2020


LOC=/home/musleh/programming/cpp
DIR=''
FILE=''

usage () {
    echo "Usage: ${0} [-i INPUT FILE] [-d DIRECTORY ]" >&2
    echo "Build and Run C++ program"
    echo "  -i  INPUT FILE  Specify the input file"
    echo "  -d  DIRECTORY  Specify the Directory"
    exit 1
}

execute () {
    cd ${LOC}/${DIR}
    clang++ ${FILE} -o a
    time ./a
    rm a

    if [[ $? -ne 0 ]]
    then
        echo "***************************Program Fail***************************"
    fi
}

while getopts i:d: OPTION 
do
	case ${OPTION} in
		d)
			DIR=${OPTARG}
			;;
		i)
			FILE=${OPTARG}
			;;
		?)
			usage 
			;;
	esac
done

if [[ $# -lt 4 ]]
then
    usage
elif [[ ! -d ${LOC}/${DIR} ]]
then
    echo "${DIR} dir not found!" >&2
elif [[ ! -f ${LOC}/${DIR}/${FILE} ]]
then
    echo "${FILE} file not found!" >&2
else
    execute
fi