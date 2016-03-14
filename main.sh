#!/bin/bash

#we create a few basic commands like add <jira>, edit, remove, close, resolve, comment, assign, etc

#the interface should be interactive and not outside the program. You should enter commands at a prompt like gdb or something 

#A Jira should be a export file which contains all the goodies. these commands should append/edit/rewrite information. 

#sync should be done through github itself. Each command should first pull, edit, then push. Random numbers can be generated through unix timestamps etc

#there should be a main while loop blocked by a read command 

#the script should be able to push/pull without password. 

#there should be an installer that drops this in your bin so you can call it anywhere Remember to keep all paths absolute

source tool.sh

include globals
include object
include user
include tool



printf "Welcome to mygit! Please enter your username (if you aren't setup yet, enter 'new' here and help on the command line): "
read username

export username="$username"

while [ "$command" != "" ]; do 
	printf "mygit> "
	read command
	"$command"
done
