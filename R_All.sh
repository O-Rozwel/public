#!/bin/bash
if [[ $# == 0 ]]
then
    dir=/R_Lib
else
    dir=$1
fi

. $dir/R_Assert.sh
. $dir/R_Bool.sh
. $dir/R_Echo.sh
. $dir/R_File.sh
. $dir/R_Mount.sh
. $dir/R_Path.sh
. $dir/R_Regex.sh
. $dir/R_String.sh
. $dir/R_Gdb.sh