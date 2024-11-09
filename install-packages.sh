#!/bin/bash

# Check if the script is run as root
check_root () { 
		if [[ $EUID -ne 0 ]]; then
   # If the current user is not root , print an error message
			ECHO "Error message: This script must run as root" 
			exit 1

		fi
}

# Verify that the packages_list.txt exists
check_package_list() {
# Check if the file 'list_packages.txt' exists in the current directory
    if [[ ! -f list_packages.txt ]]; then
 # If the file doesn't exist, print an error message    
     echo "Error message: list_packages.txt does not exist" 
# Exit the script with status code 1	    
     		exit 1

	fi
}

# Install packages 
install.packages() {

# Read and install packages
# Loop through each line of the file 'list_packages.txt'
while read -r package; do
# Check if the package variable is not empty
    if [[-n "$package" ]]; then
     # Print the package being installed
	    echo "Installing $package"
     # If pacman fails to install the package, print a failure message
	    pacman -S --noconfirm "$package" 
        if [[ $? -ne 0 ]]; then
            echo "Error message: Failed to install $package."
	
        else
# Print installed successfully if installation is succesful
            echo "$package installed successfully."
        fi


done < list_package.txt
}

# Check root permissions
check_root
# Check that list_packages.txt exists
check_package
# Install_packages
install_packages

#Print all packages installed
echo "All packages installed."
