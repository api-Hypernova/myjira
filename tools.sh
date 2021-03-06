#!/bin/bash


#alias include="source '${install_dir}/$1.sh'"


tools_error_throw()
{
        printf "throw(): "
        for x in $#; do
                printf "$x: "
        done
        exit 1
}
export -f tools_error_throw


tools_property_set() #meant to operate on name value pairs
{
    name="$1"
    value="$2"
    filename="$3"
    if [ ! -e "$filename" ]; then
        throw "main.sh" "property" "set"
    fi
    cat "$filename" | grep -v ^${name}= > $temp/"$filename"
    echo "${name}=${value}" >> $temp/"$filename"
    mv $temp/"$filename" "$filename"
}
export -f tools_property_set

tools_property_delete() #meant to operate on name value pairs
{
    name="$1"
    filename="$2"
    if [ ! -e "$filename" ]; then
        throw "main.sh" "property" "set"
    fi
    cat "$filename" | grep -v ^${name}= > $temp/"$filename"
    mv $temp/"$filename" "$filename"
}
export -f tools_property_delete

tools_help() #usual
{
        echo "Functions and options (for usage, run the command with no args):"
        echo object_add
        echo object_edit
        echo object_close
        echo object_resolve
        echo object_comment
        echo object_assign
        echo object_show
        echo user_show
        echo user_edit
        echo user_add
}
export -f tools_help

sync_pull() #here we use git and free github to its fullest extent :D
{
       #this will be called immediately when one of the function commands is run 
	echo
}
export -f sync_pull

sync_push() # yup 
{
       #this will be called each time an object_ command is called
	echo
}
export -f sync_push

install()
{
        #simply move the real executable to a place in the default path (probably some bin)
	echo
}
export -f install
