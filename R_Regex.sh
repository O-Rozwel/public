#！/bin/bash

#注释：正则表达式不能用双引号，否则会被视作字符串
#$1 regex
#$2 string
function R_RegularExpression()
{
    if [ $# -ne 2 ]
    then
        return $R_False
    fi
    
    if [[ $2 =~ $1 ]]
    then
        echo $R_True
        return $R_True
    else
        echo $R_False
        return $R_False
    fi
}