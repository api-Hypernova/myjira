#!/bin/bash

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
        printf "Enter a new username: "
        read username
        export username="$username"
	if [ "$(cat $user_list | grep ^username)" != "" ]; then
		echo Sorry, this name is already in use. Please re-try user_add.
	else 
	        echo "New account created: ${username}"
	        echo "Type 'help' at the prompt for more information"
	        echo "$username" >> "$user_list"
		touch ${users_dir}/${username}.usr
		#etc etc
	fi
}
