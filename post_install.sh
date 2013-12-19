#! /bin/sh
# script runs after debian installer has done its thing

chroot /target adduser --gecos "" --disabled-password steam
chroot /target usermod -a -G desktop,audio,dip,video,plugdev,netdev,bluetooth steam
echo "steam:steam" | chroot /target chpasswd
cp -r /cdrom/recovery /target/boot > /target/var/log/post_install.log
mv /target/boot/recovery/live /target/boot/recovery/live-hd
chroot /target date > /target/etc/skel/.imageversion
cp /target/etc/skel/.imageversion /target/home/steam/.imageversion

#
# Add post-logon configuration script
#
cat - > /target/home/desktop/post_logon.sh << 'EOF'
#! /bin/bash
if [[ "$UID" -ne "0" ]]
then
  sudo /home/desktop/post_logon.sh
  exit
fi
# Enable desktop shortcuts for the GNOME desktop, including return to steam
gsettings set org.gnome.desktop.background show-desktop-icons true
/usr/lib/x86_64-linux-gnu/lightdm/lightdm-set-defaults -a steam -s steamos
dbus-send --system --type=method_call --print-reply --dest=org.freedesktop.Accounts /org/freedesktop/Accounts/User1000 org.freedesktop.Accounts.User.SetXSession string:gnome
dbus-send --system --type=method_call --print-reply --dest=org.freedesktop.Accounts /org/freedesktop/Accounts/User1001 org.freedesktop.Accounts.User.SetXSession string:steamos
for i in `sudo dkms status | cut -d, -f1-2 | tr , / | tr -d ' '`; do sudo dkms remove $i --all; done
passwd --delete steam
plymouth-set-default-theme -R steamos
update-grub
grub-set-default 0
# boot into recovery partition on the next boot
grub-reboot "Capture System Partition"
passwd --delete desktop
rm /home/desktop/post_logon.sh && reboot
EOF
chmod +x /target/home/desktop/post_logon.sh

#
# Boot splash screen and GRUB configuration
#
cat - > /target/etc/default/grub << EOF
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=saved
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=1
GRUB_DISTRIBUTOR=\`lsb_release -i -s 2> /dev/null || echo Debian\`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
GRUB_BACKGROUND=/usr/share/plymouth/themes/steamos/steam.png
GRUB_DISABLE_LINUX_RECOVERY="true"
GRUB_GFXMODE=1280x800-24
EOF

# Add system partition backup/restore to the boot menu
RECOVERYPARTITION=`mount | grep "/target/boot/recovery " | cut -f1 -d' '`
ROOTPARTITION=`mount | grep "/target " | cut -f1 -d' ' | cut -f3 -d'/'`
SWAPPARTITION=`tail -1 /proc/swaps | cut -f1 -d' '`
if test -n "${RECOVERYPARTITION}" && test -n "${ROOTPARTITION}" && test -n "${SWAPPARTITION}"; then
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
  linux /live-hd/vmlinuz boot=live config  noswap edd=on nomodeset noprompt locales="en_US.UTF-8" keyboard-layouts=NONE ocs_prerun="mount ${RECOVERYPARTITION} /home/partimag" ocs_live_run="ocs-sr -q2 -c -j2 -z1p -i 2000 -sc -p true saveparts steambox ${ROOTPARTITION}" ocs_live_extra_param="" ocs_live_batch=no vga=788 ip=frommedia   live-media-path=/live-hd bootfrom=${SWAPPARTITION} toram=filesystem.squashfs i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.enable_fbdev=no
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
else
echo "Missing one of /, /boot/recovery, or swap. Disabling recovery partition support"
fi
