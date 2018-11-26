#!/bin/bash

#$1 format
#$2 output
function R_Echo()
{
    echo -e "\e[1m"$*"\e[0m"
}

function R_Echo_Type()
{
    local ncount
    
    if [[ $# != 1 ]]
    then
        R_Echo Param Err !!
    elif [[ $1 =~ ^[0-9]$ ]]
    then
        echo -ne "\e[$1m"
    elif [[ $1 =~ ^[0-9]+[Uu]$ ]]
    then
        ncount=`echo $1|sed -n 's/.$/''/p'`
        echo -ne "\e[${ncount}A"
    elif [[ $1 =~ ^[0-9]+[Dd]$ ]]
    then
        ncount=`echo $1|sed -n 's/.$/''/p'`
        echo -ne "\e[${ncount}B"
    elif [[ $1 =~ ^[0-9]+[Rr]$ ]]
    then
        ncount=`echo $1|sed -n 's/.$/''/p'`
        echo -ne "\e[${ncount}C"
    elif [[ $1 =~ ^[0-9]+[Ll]$ ]]
    then
        ncount=`echo $1|sed -n 's/.$/''/p'`
        echo -ne "\e[${ncount}D"
    else
        R_Echo Param Err !!
    fi
}