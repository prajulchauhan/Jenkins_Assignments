#!/bin/bash
source osType.sh
source selectVersion.sh 
PACKAGE='haproxy'

function installPackage(){
    SPECIFICVERSION="$1"
    getDistro
    indempotency $SPECIFICVERSION

if [ $INSTALLER=='new' ]
then    
    if [ $VERSION=='default' ]
    then
        case $DISTRO in 
        ubuntu)        
            echo "123" | sudo -S apt install -y $PACKAGE
            ;;

        centos)
            echo "123" | sudo -S yum install -y $PACKAGE
            ;;
        *)
            echo "No Distro supported"
            ;;
        esac
    elif [ $VERSION=="$SPECIFICVERSION" ]
    then 
        case $DISTRO in 
        ubuntu)        
            echo "123" | sudo -S apt install -y $PACKAGE=$SPECIFICVERSION
            ;;
        centos)
            echo "123" | sudo -S yum install -y $PACKAGE=$SPECIFICVERSION
            ;;
        *)
            echo "No Distro supported"
            ;;
        esac
    else
            "Nothing To Do ! Thanks"
            exit
    fi
else
    "Awesome. You Already have HaProxy!"
    exit
fi

    
}
installPackage $1