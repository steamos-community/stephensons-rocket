steamos-installer
=================

Ye Olde SteamOSe - a modified SteamOS installer, with support for older and virtualized computers

The future is here, but it's a bit new isn't it?
SteamOS is now shipping, in beta form at least, and it's all cool and stuff.

But what about those of us without a modern, UEFI-based computer spare?

Ye Olde SteamOSe is for you.

Improvements
============
SteamOS requires UEFI. Ye Olde SteamOSe works with UEFI or BIOS
SteamOS requires a USB Stick to install. Ye Olde SteamOSe works from a DVD or a USB Stick
SteamOS requires a real computer. Ye Olde SteamOSe has 3D acceleration on VMWare and Virtualbox, out of the box
SteamOS says it needs 500GB of disk space, but that's a lie. Ye Olde SteamOSe requires the same amount of space as SteamOS really does - 30.5GB plus space for games
SteamOS running in VMWare Workstation 10

Planned improvements
====================
Remove NVIDIA assumptions

How to install?
===============
A DVD image will be made available soon. Otherwise, clone this repo, fix gen.sh for your paths, and run it. This yeolde.iso file will work if burned, or dd'd to a USB stick. Beyond that, just follow Valve's instructions from http://store.steampowered.com/steamos/buildyourown

You can write to your USB stick using the following command:

```
sudo dd bs=4M if=yeoldesteamos-1.0beta1alpha1.iso of=/dev/sdX
```

Make sure to replace X in /dev/sdX with the right character to point to your USB drive (you can use for example dmesg to figure out which devices where mounted recently).

Known issues
============
Recovery partition capture totally breaks right now. Just restart your computer when it inevitably drops to an initramfs prompt after running the post_install.sh script.
How can I help?
Test it and report back to #steamos on Freenode

Or support me by donating - VMWare Workstation is a whopping £190, so when the 30 day trial expires, I stop testing with it. Donate via PayPal, Steam, or Amazon
