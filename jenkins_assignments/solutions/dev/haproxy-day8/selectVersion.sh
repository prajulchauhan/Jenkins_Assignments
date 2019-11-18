#!/bin/bash


VERSION='default'

function selectVersion (){
    echo $SPECIFICVERSION
    if ! [ $SPECIFICVERSION ]
    then
        VERSION='default'
    else
        VERSION=$SPECIFICVERSION
    fi
}

function indempotency () {
    selectVersion $SPECIFICVERSION

    haproxy -v 
    if [ $?!='0' ]
    then
        INSTALLER='new'    
    else
        INSTALLER='alreadyexist'
    fi
}
