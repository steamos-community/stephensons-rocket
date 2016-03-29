# About
This page contains instructions on how to set up the requirements for building Stephenson's Rocket ISOs on multiple different distros.
# Distros
***

## Ubuntu/Mint/Elementary/Debian/SteamOS
Stephenson's Rocket is currently the easiest to build on these distos, because all the required tools are available in the repositories of these distros. On SteamOS, do make sure you have the Debian repo added, though. Installing all dependencies for generating your own ISOs is as simple as running the following command:

`sudo apt-get install reprepro xorriso rsync wget lftp p7zip-full realpath`

## Fedora/Centos/RHEL
Building Stephenson's Rocket on Fedora is possible, but requires you to manually compile xorriso (the version in the repo doesn't have what we need) and reprepro. First you'll need to install the dependencies found in the repo:

`sudo dnf install p7zip p7zip-plugins`

Note: on Centos or RHEL, replace all instances of the dnf command with yum.

You can compile reprepro like this:
````
sudo dnf install git gcc libdb-devel zlib-devel gpgme-devel libarchive-devel
git clone git://git.debian.org/mirrorer/reprepro.git
cd reprepro
./configure --with-libarchive
make
sudo make install
````

Compiling xorriso can be found in the repo, but we'll have to compile it manually to get what we need:
````
sudo builddep xorriso
wget https://www.gnu.org/software/xorriso/xorriso-1.4.2.tar.gz
tar -xvf xorriso-1.4.2.tar.gz
cd xorriso-1.4.2
./configure
make
sudo make install
````

## Arch/Antegeros
In Arch installing the dependencies for building is a bit easier than in Fedora, since reprepro is in the AUR. First we install the dependencies found in the regular repository:

- `sudo pacman -S wget rsync lftp p7zip`

You'll find reprepro [here](https://aur.archlinux.org/packages/reprepro/) or you could install it with an AUR helper like pacaur:

- `pacaur -S  reprepro`

You'll still have to compile xorriso manually, since the version in the repo doesn't have the features we need. You can compile it with the default settings, which should look something like this:

````
wget https://www.gnu.org/software/xorriso/xorriso-1.4.2.tar.gz
tar -xvf xorriso-1.4.2.tar.gz
cd xorriso-1.4.2
./configure
make
sudo make install
````

Instead of running make install, you could also change the path to include the directory in which you build xorriso. This does take a bit more effort.

## Other distros
What's listed here is what has been tested and documented so far, but it is very likely you can get Stephenson's Rocket to build on any other distro or perhaps even other Unix-like operating systems.
