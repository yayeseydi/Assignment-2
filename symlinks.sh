#!/bin/bash

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

