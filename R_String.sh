#!/bin/bash

#可以使用-l -r扩展设置左右边界；
#若不设置则取默认值：左边界=字符串左端，右边界=字符串右端
function R_GetSubString()
{
    if [[ $# != 2 ]] || [[ ! $1 =~ ^([0-9]+|l)$ ]] || [[ ! $2 =~ ^([0-9]+|r)$ ]]
    then
        R_Echo "Param ERR !!"
        return $R_False
    fi

    input=`cat /dev/stdin`
    
    local ncount=`echo $input|awk {'print NF'}`
    local l_left=`[[ $1 == l ]] && echo 1 || echo $1`
    local l_right=`[[ $1 == r ]] && echo $ncount || echo $2`

    echo `echo $input|awk -v left=$l_left -v right=$l_right {'for(i=left;i<=right && i<=NF;i++) printf $i " "'}`
    return $R_True
}