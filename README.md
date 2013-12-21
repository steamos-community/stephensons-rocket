steamos-installer
=================

Ye Olde SteamOSe - a modified SteamOS installer, with support for older and virtualized computers

The future is here, but it's a bit new isn't it?
SteamOS is now shipping, in beta form at least, and it's all cool and stuff.

But what about those of us without a modern, UEFI-based computer spare?

Ye Olde SteamOSe is for you.

Improvements
============
* SteamOS requires UEFI. Ye Olde SteamOSe works with UEFI or BIOS
* SteamOS requires a USB Stick to install. Ye Olde SteamOSe works from a DVD or a USB Stick
* SteamOS requires a real computer. Ye Olde SteamOSe has 3D acceleration on VMWare and Virtualbox, out of the box
* SteamOS says it needs 500GB of disk space, but that's a lie. Ye Olde SteamOSe requires the same amount of space as SteamOS really does - 40.5GB minimum (of that 10GB and any more available is for games)
* SteamOS takes over your PC. Ye Olde SteamOSe supports dual-boot on non-LVM non-RAID systems

Planned improvements
====================
* Support for LVM, MD RAID, LUKS encryption
* More firmware for various devices (wired & wireless) out of the box
* Add NTFS installer modules (allow Windows partition resizing)

How to install?
===============
A DVD image is always available via BitTorrent at http://directhex.github.io/steamos-installer/

To get started, download the torrent.

Otherwise, clone this repo, and run gen.sh.

Installing from a DVD
---------------------
Just burn the ISO to a blank DVD from your favourite tool, and boot it.

Installing from USB (Mac)
-------------------------
Open a Terminal window from the Utilities section of Applications.

Type "diskutil list" to get a list of devices - one of them will be your USB stick (e.g. /dev/disk2). Follow the Linux instructions below, with this /dev/diskX entry instead of /dev/sdX

Installing from USB (Linux)
---------------------------
As root (e.g. use "sudo") run "dd bs=1M if=/path/to/yeolde.iso of=/dev/sdX" - sdX should be the USB stick device (check "dmesg" immediately after plugging it in, you should see the device. Be sure to use sdX, not sdX1 or sdX2. Then boot into the stick.

Installing from USB (Windows)
-----------------------------
Download this bundle and extract it to an empty folder. Copy or move your Ye Olde SteamOSe ISO to this folder too.

Right click the "bash.exe" file, and click "Run as Administrator". This will give you a minimal UNIX shell.

Before plugging in your USB stick, type "./ls /dev" to see what Cygwin thinks are the available devices. Take note of the entries starting "sd", e.g. "sda5" - these are your existing partitions.

Now plug in your USB stick, and run "./ls /dev" again - you should see new sd entries, e.g. "sdb" and "sdb1" - the entry without the number is your USB stick device.

Finally run "./dd bs=1M if=ye<TAB> of=/dev/sdX" - you won't get a progress bar, but it should only take about 5 minutes.

I wish these instructions were easier, but every non-GNU tool I tried on Windows to do this failed!

Once the installer is up...
---------------------------
Pick the "Automatic Install" option to wipe the first hard disk in your system and install SteamOS to it.

For more sophisticated booting - e.g. dual-boot or custom partition sizes - select the "Expert" or "Power User" options - thse are documented on the Wiki.

Beyond that, just follow Valve's instructions from their site - Ye Olde SteamOSe should behave exactly like the real SteamOS, except it works on more systems

Known issues
============
* Possible issue with firmware loading on Realtek network cards.
* 3D support is broken in Big Picture Mode itself and in 32-bit games in VirtualBox. This is a flaw in the Debian packaging of the VirtualBox guest drivers.

How can I help?
===============
Test it and report back to #steamos on Freenode

Or support me by donating - VMWare Workstation is a whopping £190, so when the 30 day trial expires, I stop testing with it. Donate via PayPal, Steam, or Amazon
