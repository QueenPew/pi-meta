#!/bin/bash -e

echo "Setting up /etc/apt/sources.list"
echo "Updating..."
sudo apt update;
echo "Upgrading packages...";
sudo apt upgrade -y ;
echo "Installing packages...";
sudo apt install build-essential cmake git ninja wget curl chromium-browser mesa-utils python3 gcc -y;
echo "Getting mesa dependencies.";
sudo apt-get install libxcb-randr0-dev libxrandr-dev 

        libxcb-xinerama0-dev libxinerama-dev libxcursor-dev 
        libxcb-cursor-dev libxkbcommon-dev xutils-dev 
        xutils-dev libpthread-stubs0-dev libpciaccess-dev 
        libffi-dev x11proto-xext-dev libxcb1-dev libxcb-*dev 
        bison flex libssl-dev libgnutls28-dev x11proto-dri2-dev 
        x11proto-dri3-dev libx11-dev libxcb-glx0-dev 
        libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev 
        libva-dev x11proto-randr-dev x11proto-present-dev 
        libclc-dev libelf-dev git build-essential mesa-utils 
        libvulkan-dev ninja-build libvulkan1 python-mako 
        libdrm-dev libxshmfence-dev libxxf86vm-dev 
        python3-mako python3-pip libzstd-dev pkg-config -y
sudo pip3 install meson
echo "Getting pi-apps and installing it..."
cd $HOME
git clone https://github.com/Botspot/pi-apps
~/pi-apps/install
echo "Getting Mesa and installing it."
git clone git://anongit.freedesktop.org/mesa/mesa
cd mesa
git fetch
git checkout 20.3
meson -Dplatforms=x11 -Dvulkan-drivers=broadcom -Ddri-drivers= -Dgallium-drivers=v3d,kmsro,vc4,virgl -Dbuildtype=release builddir/ # Compiles Mesa for the Pi 4(and below?).
ninja -C builddir/
sudo ninja -C builddir/ install 
echo "Done! Please reboot when convenient."