#!/bin/bash

function getDistro() {
    DISTRO=$(echo "123" | sudo -S cat /etc/os-release | grep -i  "^ID=" |cut -d"=" -f2)
    if [ $?=="0" ]
    then
        DISTRO=$DISTRO       
    else
        "Distro Selection Error ! script is stopping"
        exit
    fi 
}
