# About
This page contains instructions on how to set up the requirements for building Stephenson's Rocket ISOs on multiple different distros.
# Distros
***

## Ubuntu/Mint/Elementary/Debian/SteamOS
Stephenson's Rocket is currently the easiest to build on these distos, because all the required tools are available in the repositories of these distros. On SteamOS, do make sure you have the Debian repo added, though. Installing all dependencies for generating your own ISOs is as simple as running the following command:

`sudo apt-get install reprepro xorriso rsync wget lftp p7zip-full realpath`

## Fedora

Install git:
sudo dnf install git

Compile reprepro:
git clone git://git.debian.org/mirrorer/reprepro.git
sudo dnf install gcc libdb-devel zlib-devel gpgme-devel libarchive-devel
cd reprepro
./configure --with-libarchive
make
sudo make install

compile xorriso:
sudo dnf builddep xorriso
wget https://www.gnu.org/software/xorriso/xorriso-1.4.2.tar.gz
tar -xvf xorriso-1.4.2.tar.gz
cd xorriso-1.4.2
./configure
make
sudo make install

Build the iso:
git clone https://github.com/sharkwouter/stephensons-rocket.git
cd stephensons-rocket
sudo dnf install p7zip p7zip-plugins
./gen.sh

## Arch/Antegeros

`sudo pacman -S  reprepro`

`pacaur -S wget libisoburn rsync lftp p7zip`
