#!/bin/bash

#judge where a folder is mounted
#$1 dir in linux
function R_IsPathMounted()
{
    if [[ $# != 1 ]]
    then
        echo $R_False
        return $R_False
    fi
    
    ret=`mountpoint $1`
    
    if [[ $? == $R_True ]]
    then
        echo $R_True
        return $R_True
    else
        echo $R_False
        return $R_False
    fi
}

#mount a folder
#$1 ip_peer
#$2 username
#$3 password
#$4 dir in windows
#$5 dir in linux
function R_Mount()
{
    if [[ $# != 5 ]]
    then
        return $R_False
    fi

    mount -t cifs -o username=$2,password=$3 //$1$4 $5

    return $?
}

#umount a folder
#$1 dir in linux
function R_Umount()
{
    if [[ $# != 1 ]]
    then 
        return $R_False
    fi
    
    while [[ `R_IsPathMounted $1` == $R_True ]]
    do
        ret=`umount $1`
        
        if [[ $? != $R_True ]]
        then
            R_Echo "Umount" $1 "fail, skip this operation!"
            break;
        fi
    done
    
    return $R_True
}