#!/bin/sh -e
if [ "$EUID" = 0 ]
    then    
        echo "You cannot run this script as root! Exiting."
        exit 1
fi 
printf "Updating..."
    sudo apt-get update > /dev/null ;
printf "Upgrading packages...\n";
    sudo apt-get upgrade -y > /dev/null;
printf "Installing packages...\n";
    sudo apt-get install build-essential cmake wget curl gcc llvm yad git -y > /dev/null;
printf "Making the apps folder folder";
mkdir -p $HOME/pi-meta/apps/
printf "Getting the apps\n";
    cd $HOME/pi-meta/apps
    git clone https://github.com/Botspot/pi-apps &&  git clone https://github.com/chunky-milk/pi-bashscripts-files 
printf "Installing Pi-apps"
    $HOME/pi-meta/apps/pi-apps/install
printf "\nDone! The collection of scripts are located in $HOME/pi-meta/apps/ . "