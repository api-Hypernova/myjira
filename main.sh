#!/bin/bash

#we create a few basic commands like add <jira>, edit, remove, close, resolve, comment, assign, etc

#the interface should be interactive and not outside the program. You should enter commands at a prompt like gdb or something 

#A Jira should be a export file which contains all the goodies. these commands should append/edit/rewrite information. 

#sync should be done through github itself. Each command should first pull, edit, then push. Random numbers can be generated through unix timestamps etc

#there should be a main while loop blocked by a read command 

#the script should be able to push/pull without password. 

#there should be an installer that drops this in your bin so you can call it anywhere Remember to keep all paths absolute
export namespace="main"
export temp="/tmp/"
export install_dir="~/myjira"
export repo=""
export user_list="${install_dir}/users.txt"
export object_list="${install_dir}/objects.txt"
export object_dir="${install_dir}/objects"

error_throw()
{
	printf "throw(): "
	for x in $#; do
		printf "$x: "
	done 
	exit 1
}


property_set() #meant to operate on name value pairs
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

property_delete() #meant to operate on name value pairs
{
    name="$1"
    filename="$2"
    if [ ! -e "$filename" ]; then
        throw "main.sh" "property" "set"
    fi
    cat "$filename" | grep -v ^${name}= > $temp/"$filename"
    mv $temp/"$filename" "$filename"
}

#sync_pull() #here we use git and free github to its fullest extent :D
#{
#	#this will be called immediately when one of the function commands is run 
#}

#sync_push() # yup 
#{
#	#this will be called each time an object_ command is called
#}



#install()
#{
	#simply move the real executable to a place in the default path (probably some bin)
#}

help() #usual
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


object_add()
{
	#this is a good starting point
	cat object_struct | while read field; do
		echo
	done
}

object_edit()
{
	echo	#we need that setProperty function from client.sh :)
}

object_close() #just a shortcut to call edit
{
	echo
}

object_resolve() #just a shortcut to call edit
{
	echo
}

object_comment()
{
	echo
}

object_assign() #just a shortcut to call edit
{
	echo
}

object_show() #so the object file is just a bunch of name value pairs. Here we are gonna output that all in a format that looks really nice
{
	echo
}

user_show()
{
	echo
}

user_edit()
{
	echo
}

user_add()
{
	echo "Creating new account..."
	printf "Enter a username: " 
	read username
	export username="$username"
	echo "New account created: ${username}"
	echo "Type 'help' at the prompt for more information"
	echo "$username" >> "$user_list"
}

command=""
printf "Welcome to mygit! Please enter your username (newuser if you have no username yet): "
read username

if [ "$username" == "newuser" ]; then
	user_add 
fi

export username="$username"

while [ "$command" != "" ]; do 
	printf "mygit> "
	read command
	$command
done
