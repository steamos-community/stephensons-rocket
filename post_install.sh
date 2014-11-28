#! /bin/sh
# script runs after debian installer has done its thing

#Fix dmraid
if test -x /sbin/dmraid
then
  for i in `dmraid -c -s`
    do sed -ir "s#(/dev/mapper/${i})p([0-9]+\s)#\1\2#" /target/etc/fstab
  done
fi

chroot /target adduser --gecos "" --disabled-password steam
chroot /target usermod -a -G desktop,audio,dip,video,plugdev,netdev,bluetooth,pulse-access steam
chroot /target usermod -a -G pulse-access desktop
chroot /target /usr/lib/x86_64-linux-gnu/lightdm/lightdm-set-defaults -a steam
cp -r /cdrom/recovery /target/boot > /target/var/log/post_install.log
mv /target/boot/recovery/live /target/boot/recovery/live-hd
chroot /target date > /target/etc/skel/.imageversion
cp /target/etc/skel/.imageversion /target/home/steam/.imageversion

#
# Add post-logon configuration script
#
cat - > /target/usr/bin/post_logon.sh << 'EOF'
#! /bin/bash
if [[ "$UID" -ne "0" ]]
then
  #
  # Wait up to 10 seconds and see if we have a connection. If not, pop the network dialog
  #
  nm-online -t 10 -q
  if [ "$?" -ne "0" ]; then
    while true;
    do
      zenity --info --title="SteamOS Install" --text="SteamOS cannot connect to the internet. An internet connection is required to continue installation. If you have a wireless network, configure it now."
      nm-connection-editor --type=802-11-wireless --show
      nm-online -t 30
      if [ "$?" -eq "0" ]; then 
        break
      fi
      echo "Still waiting for internet connection..."
    done
  fi
  # dummy file to skip the Steam Install Agreement dialog
  touch ~/.steam/steam_install_agreement.txt
  # pass -exitsteam so steam doesn't actually run after bootstrapping
  steam -exitsteam
  rm ~/.steam/starting
  cp ~/.local/share/Steam/steam_install_agreement.txt ~/.steam/steam_install_agreement.txt
  sudo /usr/bin/post_logon.sh
  exit
fi

# Configure ufw firewall
ufw enable
# Allow ssh, but block brute force attacks
ufw limit ssh/tcp

# Allow in home streaming
ufw allow 21036
ufw allow 27037/tcp
ufw allow 27031/udp

# Disallow root login on ssh
sed -i "s/PermitRootLogin\ yes/PermitRootLogin\ no/" /etc/ssh/sshd_config

/usr/lib/x86_64-linux-gnu/lightdm/lightdm-set-defaults -a steam -s steamos
dbus-send --system --type=method_call --print-reply --dest=org.freedesktop.Accounts /org/freedesktop/Accounts/User1000 org.freedesktop.Accounts.User.SetXSession string:gnome
dbus-send --system --type=method_call --print-reply --dest=org.freedesktop.Accounts /org/freedesktop/Accounts/User1001 org.freedesktop.Accounts.User.SetXSession string:steamos
(for i in `dkms status | cut -d, -f1-2 | tr , / | tr -d ' '`; do sudo dkms remove $i --all; done) | zenity --progress --no-cancel --pulsate --auto-close --text="Configuring Kernel Modules" --title="SteamOS Installation"
plymouth-set-default-theme -R steamos
update-grub
grub-set-default 0
# boot into recovery partition on the next boot
grub-reboot "Capture System Partition"
passwd --delete desktop
rm /etc/sudoers.d/post_logon
rm /usr/bin/post_logon.sh && reboot
rm /home/steam/.config/autostart/post_logon.desktop
EOF
chmod +x /target/usr/bin/post_logon.sh

#
# Enable anyone to sudo the post logon script
#
echo ALL ALL=NOPASSWD: /usr/bin/post_logon.sh > /target/etc/sudoers.d/post_logon

#
# Set post logon to run at the first logon
#
cat - > /target/home/steam/.config/autostart/post_logon.desktop << 'EOF'
[Desktop Entry]
Type=Application
Exec=/usr/bin/post_logon.sh
X-GNOME-Autostart-enabled=true
Name=postlogon
EOF

#
# Add fstrim-all script from Ubuntu 14.04
#
cat - > /target/sbin/fstrim-all << 'EOF'
#!/bin/sh
#
# Call fstrim on mounted partitions to maintain write performance.
# This is only relevant for SSD drives, see
# http://wiki.ubuntuusers.de/SSD/TRIM
set -e

# needs /proc
[ -r /proc/mounts ] || exit 0

# these file systems support trimming
SUPPORTED_FS="ext3 ext4 xfs btrfs"

# arguments: <haystack> <needle>
contains() {
    [ "${1#*$2}" != "$1" ]
}

# As long as there are bugs like https://launchpad.net/bugs/1259829 we only run
# fstrim on Intel and Samsung drives; with --no-model-check it will run on all
# drives instead.
if [ "$1" = "--no-model-check" ]; then
    NO_MODEL_CHECK=1
fi

DONE=''
while read DEV MOUNT FSTYPE OPTIONS REST; do
    # only consider /dev/*
    [ "${DEV#/dev}" != "$DEV" ] || continue
    # ignore mounts with "discard", they TRIM already
    if contains "$OPTIONS" discard; then continue; fi
    # only consider supported file systems
    if ! contains "$SUPPORTED_FS" "$FSTYPE"; then continue; fi
    # ignore temporary devices which already went away
    [ -e "$DEV" ] || continue

    # did we see this already? we need to resolve symlinks
    # for/dev/disks/by-{label,uuid}, etc.; ignore if the device does not exist
    # any more
    REALDEV=`readlink -f $DEV` || continue
    if contains "$DONE" " $REALDEV "; then continue; fi
    DONE="$DONE $REALDEV "

    #echo "device $DEV real $REALDEV mountpoint $MOUNT fstype $FSTYPE"

    # check if that device supports trim; this does not work for devmapper or
    # mdadm, though, so just call fstrim on those without the extra check and
    # ignore errors; for cryptsetup and LVM you also need extra configuration
    # options to propagate discards, which the admin might have turned off
    unset SILENT_FAILURE
    if [ "${REALDEV#/dev/dm-}" != "$REALDEV" ]; then
        #echo "device $DEV is on devmapper, skipping TRIM feature check"
        SILENT_FAILURE=1
    elif [ "${REALDEV#/dev/md}" != "$REALDEV" ]; then
        #echo "device $DEV is on mdadm, skipping TRIM feature check"
        SILENT_FAILURE=1
    elif ! type hdparm >/dev/null 2>&1; then
        #echo "hdparm not available, cannot TRIM"
        exit 0
    else
        HDPARM="`hdparm -I $REALDEV`" 2>/dev/null || continue
        if [ -z "$NO_MODEL_CHECK" ]; then
            if ! contains "$HDPARM" "Intel" && \
               ! contains "$HDPARM" "INTEL" && \
               ! contains "$HDPARM" "Samsung" && \
               ! contains "$HDPARM" "SAMSUNG" && \
               ! contains "$HDPARM" "OCZ" && \
               ! contains "$HDPARM" "SanDisk" && \
               ! contains "$HDPARM" "Patriot"; then
                #echo "device $DEV is not a drive that is known-safe for trimming"
                continue
            fi
        fi
        if ! contains "$HDPARM" "TRIM"; then
            #echo "device $DEV does not support trimming"
            continue
        fi
    fi

    if [ -n "$SILENT_FAILURE" ]; then
        fstrim $MOUNT 2>/dev/null || true
    else
        fstrim $MOUNT
    fi
done < /proc/mounts
EOF
chmod +x /target/sbin/fstrim-all

#
# Add fstrim cron script
#
cat - > /target/etc/cron.weekly/fstrim << 'EOF'
#!/bin/sh
# call fstrim-all to trim all mounted file systems which support it
set -e

# This only runs on Intel and Samsung SSDs by default, as some SSDs with faulty
# firmware may encounter data loss problems when running fstrim under high I/O
# load (e. g.  https://launchpad.net/bugs/1259829). You can append the
# --no-model-check option here to disable the vendor check and run fstrim on
# all SSD drives.
exec fstrim-all
EOF
chmod +x /target/etc/cron.weekly/fstrim

#
# Disable mouse acceleration
#
cat - > /target/etc/X11/xorg.conf.d/50-mouse-acceleration.conf << 'EOF'
Section "InputClass"
	Identifier "My Mouse"
	MatchIsPointer "yes"
	Option "AccelerationProfile" "-1"
	Option "AccelerationScheme" "none"
EndSection
EOF

#
# Add firewall shortcut to desktop's desktop
#
#
cat - > /target/home/desktop/gufw.desktop << 'EOF'
#!/usr/bin/env xdg-open
[Desktop Entry]
Name=Firewall Configuration
Comment=the gufw interface for the ufw firewall
Exec=/usr/bin/gufw
Icon=gufw
Terminal=false
Type=Application
EOF
chmod +x /target/home/desktop/gufw.desktop

#
# Set set-passwd.sh to run when desktop first logs in
#
#
cat - > /target/home/desktop/.config/autostart/set-passwd.desktop << 'EOF'
#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Exec=/home/desktop/set-passwd.sh
X-GNOME-Autostart-enabled=true
Name=set-passwd
EOF
chmod +x /target/home/desktop/.config/autostart/set-passwd.desktop
chown /target/home/desktop/.config/autostart/set-passwd.desktop

#
# Add set-passwd.sh to set the desktop user's password
#
#
cat - > /target/home/desktop/set-passwd.sh << 'EOF'
#!/bin/bash
set -e
gnome-terminal -x /bin/bash -c "while [ $(passwd -S|cut -d" " -f2) = "NP" ]; do passwd; done ; exec /bin/bash"
rm ~/.config/.autostart/set-passwd.desktop
rm ~/set-passwd.sh
EOF
chmod +x /target/home/desktop/set-passwd.sh
chown /target/home/desktop/set-passwd.sh

#
# Boot splash screen and GRUB configuration
#
if test `/target/bin/grep -A10000 "### BEGIN /etc/grub.d/30_os-prober ###" /target/boot/grub/grub.cfg | /target/bin/grep -B10000 "### END /etc/grub.d/30_os-prober ###" | wc -l` -gt 4; then
ISDUALBOOT=Y
else
ISDUALBOOT=N
fi
cat - > /target/etc/default/grub << EOF
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=saved
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_DISTRIBUTOR=\`lsb_release -i -s 2> /dev/null || echo Debian\`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
GRUB_BACKGROUND=/usr/share/plymouth/themes/steamos/steam.png
GRUB_DISABLE_LINUX_RECOVERY="true"
GRUB_GFXMODE=auto
EOF
if test "${ISDUALBOOT}" = N; then
echo "GRUB_TIMEOUT=0" >> /target/etc/default/grub
echo "GRUB_HIDDEN_TIMEOUT=1" >> /target/etc/default/grub
else
echo "GRUB_TIMEOUT=5" >> /target/etc/default/grub
fi


# Add system partition backup/restore to the boot menu
RECOVERYPARTITION=`mount | grep "/target/boot/recovery " | cut -f1 -d' '`
ROOTPARTITION=`mount | grep "/target " | cut -f1 -d' ' | cut -f3- -d'/'`
SWAPPARTITION=`tail -1 /proc/swaps | cut -f1 -d' '`
ISMDRAID=`echo "${RECOVERYPARTITION} ${ROOTPARTITION} ${SWAPPARTITION}" | grep "md"`
ISLVM=`echo "${RECOVERYPARTITION} ${ROOTPARTITION} ${SWAPPARTITION}" | grep "mapper"`
if test -z "${ISLVM}" && test -z "${ISMDRAID}" && test -n "${RECOVERYPARTITION}" && test -n "${ROOTPARTITION}" && test -n "${SWAPPARTITION}"; then
if test -d /sys/firmware/efi/; then
ISEFI=Y
else
ISEFI=N
fi
cat - >> /target/etc/grub.d/40_custom << EOF
menuentry "Capture System Partition"{
  search --set -f /live-hd/vmlinuz
EOF
if test "${ISEFI}" = "Y"; then
echo "  fakebios" >> /target/etc/grub.d/40_custom
fi
cat - >> /target/etc/grub.d/40_custom << EOF
  linux /live-hd/vmlinuz boot=live config  noswap edd=on nomodeset noprompt locales="en_US.UTF-8" keyboard-layouts=NONE ocs_prerun="mount ${RECOVERYPARTITION} /home/partimag" ocs_live_run="ocs-sr -q2 -j2 -z1p -i 2000 -sc -p true saveparts steambox ${ROOTPARTITION}" ocs_live_extra_param="" ocs_live_batch=no vga=788 ip=frommedia   live-media-path=/live-hd bootfrom=${SWAPPARTITION} toram=filesystem.squashfs i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.enable_fbdev=no
  initrd /live-hd/initrd.img
}
menuentry "Restore System Partition"{
  search --set -f /live-hd/vmlinuz
EOF
if test "${ISEFI}" = "Y"; then
echo "  fakebios" >> /target/etc/grub.d/40_custom
fi
cat - >> /target/etc/grub.d/40_custom << EOF
  linux /live-hd/vmlinuz boot=live config  noswap edd=on nomodeset noprompt locales="en_US.UTF-8" keyboard-layouts=NONE ocs_prerun="mount ${RECOVERYPARTITION} /home/partimag" ocs_live_run="ocs-sr -e1 auto -e2 -r -j2 -k -p reboot restoreparts steambox ${ROOTPARTITION}" ocs_live_extra_param="" ocs_live_batch=no vga=788 ip=frommedia   live-media-path=/live-hd bootfrom=${SWAPPARTITION} toram=filesystem.squashfs i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.enable_fbdev=no
  initrd /live-hd/initrd.img
}
menuentry "Clonezilla live"{
  search --set -f /live-hd/vmlinuz
EOF
if test "${ISEFI}" = "Y"; then
echo "  fakebios" >> /target/etc/grub.d/40_custom
fi
cat - >> /target/etc/grub.d/40_custom << EOF
  linux /live-hd/vmlinuz boot=live config  noswap edd=on nomodeset noprompt locales="en_US.UTF-8" keyboard-layouts=NONE ocs_prerun="mount ${RECOVERYPARTITION} /home/partimag" ocs_live_run="ocs-live-general" ocs_live_extra_param="" ocs_live_batch=no vga=788 ip=frommedia  nosplash  live-media-path=/live-hd bootfrom=${SWAPPARTITION} toram=filesystem.squashfs i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.enable_fbdev=no
  initrd /live-hd/initrd.img
}
EOF
elif test -n "${ISMDRAID}"; then
echo "One or more of /, /boot/recovery, or swap is on mdraid. Disabling recovery partition support"
elif test -n "${ISLVM}"; then
echo "One or more of /, /boot/recovery, or swap is on LVM. Disabling recovery partition support"
else
echo "Missing one of /, /boot/recovery, or swap. Disabling recovery partition support"
fi
