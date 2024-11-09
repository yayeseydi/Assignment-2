# Assignment 2- Shell Scripting

## Project 1:

## Script 1: list-packages.sh

This script generatese a list of packages (kakoune and tmux) and saves them to a file called lpackages.txt.

list-packages.sh is used to create a record of required packages,  The list is then used to install these packages.

```
#This function lists the packages
list_packages() {
   
 #Define the list of packages
    packages=("kakoune" "tmux")
# Loop through the list of packages
for package in "${packages[@]}"; do
 # Add each package to the file
        echo "$package" >> lpackages.txt

        echo "- $package"
done
```
The packages defines the software packages to be saved. The script clears the lpackages.txt file if it exists and writes each package name into the file. This tracks the software that needs to be installed.

## Script 2: install-packages.sh

This script reads from the list_packages.txt file and installs each listed package using pacman.

This script automates the installation process for a  list of packages. It checks if the package exist and installs each package which simplifies the setup process.

```

while read -r package; do
# Check if the package variable is not empty
    if [[-n "$package" ]]; then
     # Print the package being installed
	    echo "Installing $package"
     # If pacman fails to install the package, print a failure message
	    pacman -S --noconfirm "$package" 
        if [[ $? -ne 0 ]]; then
            echo "Error message: Failed to install $package."

}

```
This code reads each line from list_packages.txt and installs it. If a package does not install, an error message is printed. If it's successful, a success message is shown. This script simplifies installing multiple packages.

## Script 3: symlinks.sh

This script creates symbolic links for configuration files, which links them to the user's home directory and other config directories.

By creating symbolic links, this script allows configuration files to be shared easily  across the users.

```
# Create symbolic links for all configuration files
ln -s ~/2420-as2-starting-files/config/home/bashrc ~/.bashrc
ln -s ~/2420-as2-starting-files/config/kak/kakrc ~/.config/kakoune/kakrc
ln -s ~/2420-as2-starting-files/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

```
This script creates symbolic links for bashrc, kakrc, and tmux.conf configuration files. By linking them, changes to these configurations are automatically reflected in the respective directories, which allows for consistency.

## Script 4: run-scripts.sh

This script calls the previous three scripts (list-packages.sh, install-packages.sh, and symlinks.sh) in order, to package listing, installing, and configuration linking.


This script makes it  convenient  to execute the entire setup process. Running one script will trigger all necessary actions, which automates the configuration and installation process.

```

./list-packages
./install-packages.sh
./symlinks.sh

```

This script runs the three main scripts in order, ensuring that packages are listed, installed, and configuration files are linked with little user intervention.

## Project 2:

## Script: create-user.sh

This script creates a new user based on the input provided by the user (username, shell, home directory, and optional groups).

It automates the process of creating a new user, setting up their shell, home directory, and adding them to any specified groups. This is useful for user in a system administration task.

```

useradd -m -s "$shell" "$username"



# Check if the useradd command worked
# $? stores the exit status of the last command.
  # If it's non-zero, it means there was an error in creating the user.

if [ $? -ne 0 ]; then

 # If useradd didn't succeed, print an error message and exit.

# $? stores the exit status of the last command.
  # If it's non-zero, it means there was an error in creating the user.
  
# If useradd didn't succeed, print an error message and exit.
  echo "Failed to create user $username" >&2
  exit 1

cp -r /etc/skel/. "$home_directory"


# If extra groups were specified, add the user to those groups
if [ ! -z "$groups" ]; then I

# If the 'groups' variable isn't empty:

usermod -aG "$groups" "$username"
fi

```

```

#Change the ownership of the home directory so the new user can access it
chown -R "$username":"$username" "$home_directory"
echo "Set the password for the new user:"
passwd "$username"

```


The useradd command creates the new user with the specified shell and home directory. If additional groups are provided, the usermod command adds the user to them. The chown command ensures the user owns their home directory, and that  passwd sets their password. This allows user creation with specific configurations and permissions.  
