#!/bin/bash

check_root () { 
		if [[ $EUID -ne 0 ]]; then
			ECHO "This script must run as root" 
			exit 1

		fi
}

# Verify that the packages_list.txt exists
check_package_list() {
    if [[ ! -f list_packages.txt ]]; then
	    echo "Error: list_packages.txt not found!" 
	    exit 1

	fi
}

# Install packages 
install.packages() {

# Read and install packages
while read -r package; do
    if [[-n "$package" ]]; then
	    echo "Installing $package"
	    pacman -S --noconfirm "$package" || echo "Failed to instal $package"
fi
done < list_package.txt
}
# Call functions in order 

# Check root permissions
check_root
# Check that list_packages.txt exists
check_package
# Install_packages
install_packages

# Define package list file
PACKAGE_FILE="lpackages.txt"

# Check that package list file exists
if [[ ! -f $PACKAGE_FILE ]]; then

# If the file doesn't exist, display error message and exit script
	echo "Error: $PACKAGE_FILE does not exist. Please create it first."
    exit 1
fi

# Display message to show the start of the package installation 
echo "Installing packages listed in $PACKAGE_FILE..."

# Read and  try to install package list
while read -r package; do
    if [[ -n $package ]]; then

# Print installing package
	echo "Installing $package..."
# Install package using pacman
	
	sudo pacman -S --noconfirm "$package"
        if [[ $? -ne 0 ]]; then
            echo "Error: Failed to install $package."
        else
# Print installed successfully if installation is succesful
            echo "$package installed successfully."
        fi
    fi

# Redirect package list
done < "$PACKAGE_FILE"

#Print all packages processed
echo "All packages processed."
