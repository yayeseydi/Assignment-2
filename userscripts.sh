#!/bin/bash

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



