#!/bin/bash

# Check if the script is run as root
check_root () { 
		if [[ $EUID -ne 0 ]]; then
   # If the current user is not root , print an error message
			ECHO "Error message: This script must run as root" 
			exit 1

		fi
}
# Store path of directory where script is located
SOURCE_DIR=$(pwd) 

# Create symbolic links for directories
mkdir -p ~/.config/kakoune
mkdir -p ~/.config/tmux

# Create symbolic links for all configuration files
ln -s ~/2420-as2-starting-files/config/home/bashrc ~/.bashrc
ln -s ~/2420-as2-starting-files/config/kak/kakrc ~/.config/kakoune/kakrc
ln -s ~/2420-as2-starting-files/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# Print "Symbolic links created successfully"
echo "Symbolic links created successfully"

