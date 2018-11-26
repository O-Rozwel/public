function R_Gdb()
{
    local filename
    local flag=0
    
    if [[ $1 == "-d" && $# == 2 ]]
    then
        filename=$2
        flag=1
    elif [[ $# == 1 ]]
    then
        filename=$1
    else
        return;
    fi
    
    if [[ -z `pidof $filename` ]]
    then
        R_Echo Query Fail !
    elif [[ $flag == 0 ]]
    then
        gdb -p `pidof $filename`
    else
        gdb `find /home/as -type d -printf '-d %p '` -p `pidof $filename`
    fi
}