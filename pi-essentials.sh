#!/bin/sh -e
if [ "$EUID" = 0 ]
    then echo "You cannot run this script as root! Exiting."
exit 1
fi 
echo "Updating..."
    sudo apt-get update > /dev/null ;
printf "Upgrading packages...\n";
    sudo apt-get upgrade -y > /dev/null;
printf "Installing packages...\n";
    sudo apt-get install build-essential cmake git wget curl chromium-browser mesa-utils python3 gcc llvm yad -y > /dev/null;
printf "Getting pi-apps and installing it...\n"
    cd $HOME
    git clone https://github.com/Botspot/pi-apps 
    ~/pi-apps/install
echo "Getting mesa dependencies.";
    sudo apt-get install libxcb-randr0-dev libxrandr-dev  libxcb-xinerama0-dev libxinerama-dev libxcursor-dev libxcb-cursor-dev libxkbcommon-dev xutils-dev xutils-dev libpthread-stubs0-dev libpciaccess-dev libffi-dev x11proto-xext-dev libxcb1-dev libxcb-*dev bison flex libssl-dev libgnutls28-dev x11proto-dri2-dev x11proto-dri3-dev libx11-dev libxcb-glx0-dev libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev libva-dev x11proto-randr-dev x11proto-present-dev libclc-dev libelf-dev git build-essential mesa-utils libvulkan-dev ninja-build libvulkan1 python-mako libdrm-dev libxshmfence-dev libxxf86vm-dev python3-mako python3-pip libzstd-dev pkg-config -y > /dev/null
    sudo pip3 install meson > /dev/null;
printf "Getting Mesa and installing it.\n"
    git clone git://anongit.freedesktop.org/mesa/mesa
    cd mesa
    git fetch
    git checkout 20.3
    meson --prefix /usr -Dplatforms=x11 -Dvulkan-drivers=broadcom -Ddri-drivers= -Dgallium-drivers=v3d,kmsro,vc4,virgl -Dbuildtype=release builddir/ > /dev/null # Compiles Mesa for the Pi 4(and below?).
printf "Building Mesa...\n"
    ninja -C builddir/ 
    sudo ninja -C builddir/ install
    cd $HOME
    sudo rm -rf mesa
printf "\nDone! Please reboot when convenient."