#!/bin/bash

# Check if the script is run as root
check_root () { 
		if [[ $EUID -ne 0 ]]; then
   # If the current user is not root , print an error message
			ECHO "Error message: This script must run as root" 
			exit 1

		fi
}

# Call list packages
echo "calling list packages:"
 ./list-packages

 echo \

# Call install packages
echo "calling install packages"
./install-packages

# Call symlinks packages
echo "calling symlink packages"
./symlinks.sh

echo \

# Print scripts called successfully
echo "scripts called successfully"



