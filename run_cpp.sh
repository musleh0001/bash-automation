#!/usr/bin/bash

# Cpp program build and run
# Author: Md Musleh Uddin
# Created at: Aug 17, 2020

FOUND=''
FILE=''

usage () {
    echo "Usage: ${0} [-i INPUT FILE]" >&2
    echo "Build and Run C++ program"
    echo "  -i  INPUT FILE  Specify the input file"
    exit 1
}

execute () {
    g++ -std=c++14 ${FOUND} -o a
    time ./a
    rm a

    if [[ $? -ne 0 ]]
    then
        echo "***************************Program Fail***************************"
    fi
}

while getopts i: OPTION 
do
	case ${OPTION} in
		i)
			FILE=${OPTARG}
			;;
		?)
			usage 
			;;
	esac
done

if [[ $# -lt 2 ]]
then
    usage
fi

FOUND=$(find /home/musleh/ -name "${FILE}")
if [[ -z ${FOUND} ]]
then
    echo "${FILE} not found!"
else
    execute
fi