#!/bin/bash

#打印上一条指令的执行情况，显示内容为输入参数；
#R_Assert会在执行失败后退出当前shell；
#R_Tssert会在执行失败后继续执行下面的指令；
#这两个函数都将透传上一条指令的返回值；
function R_Assert()
{
    ret=$?
    
    if [[ $1 == "-s" ]]
    then
        if [[ $ret != $R_True ]]
        then
            R_Echo [ERR]: `echo $*|R_GetSubString 2 r`
            exit
        fi
    else
        if [[ $ret != $R_True ]]
        then
            R_Echo [ERR]: $*
            exit
        else
            R_Echo [SUC]: $*
        fi
    fi
    
    return $ret
}
function R_Tssert()
{
    ret=$?
    
    if [[ $1 == "-s" ]]
    then
        if [[ $ret != $R_True ]]
        then
            R_Echo [ERR]: `echo $*|R_GetSubString 2 r`
        fi
    else
        if [[ $ret != $R_True ]]
        then
            R_Echo [ERR]: $*
        else
            R_Echo [SUC]: $*
        fi
    fi
    
    return $ret
}