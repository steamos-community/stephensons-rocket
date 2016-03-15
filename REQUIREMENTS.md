# About
This page contains instructions on how to set up the requirements for building Stephenson's Rocket ISOs on multiple different distros.
# Distros
***

## Ubuntu/Mint/Elementary/Debian/SteamOS
Stephenson's Rocket is currently the easiest to build on these distos, because all the required tools are available in the repositories of these distros. On SteamOS, do make sure you have the Debian repo added, though. Installing all dependencies for generating your own ISOs is as simple as running the following command:

`sudo apt-get install reprepro xorriso rsync wget lftp p7zip-full realpath`

## Fedora


## Arch/Antegeros

`sudo pacman -S  reprepro`
`pacaur -S wget libisoburn rsync lftp p7zip`
