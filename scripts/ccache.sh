#!/bin/bash

source util.sh

#Install ccache and distcc
Install_Package_If_Necessary ccache
Install_Package_If_Necessary distcc

which ccache &> /dev/null
if [ $? -eq 0 ]; then
    echo "Previous ccache settings:"
    ccache -s
    #Set the cache size limit
    ccache -M 10GB
    #Set the cache file limit
    ccache -F 20000
fi