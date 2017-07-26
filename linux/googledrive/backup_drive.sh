#!/bin/bash
# Description:	This script run grive command to sync google drive 
# Date:		19/07/2017
# Author:	Rafael Vazquez

# Parameters Configuration 
DRIVE_HOME="/home/user/GoogleDrive/"

# Script execution

# Function to launch de google drive client and sync 
exec_backup(){
	cd $DRIVE_HOME
	grive
}

# Function to verify if a grive instance is running
isRunning(){
	/bin/pidof grive
	if [[ $? -ne 0 ]]; then
		echo "grive isn't running"
		exec_backup
	else
		echo "grive is running, nothing to do"
	fi
}

isRunning

# End of Script
