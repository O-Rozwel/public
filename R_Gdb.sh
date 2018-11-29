function R_Gdb()
{
    local process_dir=2

    local app
    local dir
    local flag
    
    if [[ $# == 0 ]]
    then
        return;
    fi
    
    app=$1;
    if [[ -z `pidof $app` ]]
    then
        flag=$program;
    else
        flag=$process;
        if [[ $# == 3 && $2 == "-d" ]]
        then
            flag=$process_dir;
            dir=$3;
        fi
    fi
    
    case $flag in
        $program)
            gdb $app;
        ;;
        
        $process)
            gdb -p `pidof $app`;
        ;;
        
        $process_dir)
            gdb `find $dir -type d -printf '-d %p '` -p `pidof $app`;
        ;;
        
        *)
            return;
        ;;
    esac
}