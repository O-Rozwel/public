#！/bin/bash

#IsPathExist
function R_IsPathExist()
{
    if [[ ! -d $1 ]]
    then
        return $R_False
    else
        return $R_True
    fi
}
#IsPathExist_EX
function R_IsPathExistEx()
{
    if [[ ! -d $1 ]]
    then
        mkdir -p $1
        return $?
    fi
    
    return $R_True
}

#IsPathEmpty
function R_IsPathEmpty()
{
    if [[ `ls $1` == "" ]]
    then
        return $R_True
    else
        return $R_False
    fi
}