#!/bin/bash

#IsFileExist
function R_IsFileExist()
{
    if [[ ! -f $1 ]]
    then
    {
        return $R_False
    }
    else
    {
        return $R_True
    }
    fi
}

#IsFileExistEx
function R_IsFileExistEx()
{
    if [[ ! -f $1 ]]
    then
    {
        dir=`R_GetDir $1`

        mkdir -p $dir
        touch $1
        
        return $?
    }
    fi
    
    return $R_True
}

#GetDir
function R_GetDir()
{
    echo $1 | awk 'BEGIN{FS="/"} {for(i=1;i<NF;i++){if(i!=1){printf("/")}printf $i;}}'
}

#GetName
function R_GetName()
{
    echo $1 | awk 'BEGIN{FS="/"} {printf $NF}'
}
