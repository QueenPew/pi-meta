#!/bin/sh -e
if [ "$EUID" = 0 ]
    then echo "You cannot run this script as root! Exiting."
exit 1
fi 
printf "Updating..."
    sudo apt-get update > /dev/null ;
printf "Upgrading packages...\n";
    sudo apt-get upgrade -y > /dev/null;
printf "Installing packages...\n";
    sudo apt-get install build-essential cmake wget curl gcc llvm yad -y > /dev/null;
printf "Making the pi-meta folder"
mkdir $HOME/pi-meta/
printf "Getting pi-apps and installing it...\n"
    cd $HOME/pi-meta/
    git clone https://github.com/Botspot/pi-apps 
    $HOME/pi-meta/pi-apps/install
printf "Getting pi-bashscripts-files\n"
    cd $HOME/pi-meta/
    git clone https://github.com/chunky-milk/pi-bashscripts-files
printf "\nDone! "