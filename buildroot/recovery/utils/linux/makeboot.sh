#!/bin/bash
# Author: Steven Shiau <steven _at_ nchc org tw>
# License: GPL
# Description: Program to make USB flash drive (FAT, EXT, BTRFS or NTFS) bootable by syslinux or extlinux

# 1. Checking if partition table correct (on boundary, bootable)
# 2. cat mbr
# 3. "syslinux -f -i" or "extlinux -i"
#
# Append PATH
export PATH=/sbin:/usr/sbin:/bin:/usr/bin:$PATH

#
prog="$(basename $0)"
path_of_prog="$(LC_ALL=C cd "$(dirname "$0")/../../"; pwd)"

#
[ -z "$SETCOLOR_SUCCESS" ] && SETCOLOR_SUCCESS="echo -en \\033[1;32m"
[ -z "$SETCOLOR_FAILURE" ] && SETCOLOR_FAILURE="echo -en \\033[1;31m"
[ -z "$SETCOLOR_WARNING" ] && SETCOLOR_WARNING="echo -en \\033[1;33m"
[ -z "$SETCOLOR_NORMAL"  ] && SETCOLOR_NORMAL="echo -en \\033[0;39m"
BOOTUP="color"

#
msg_are_u_sure_u_want_to_continue='Are you sure you want to continue?'
msg_you_have_to_enter_yes_or_no="You have to enter 'y', 'yes', 'n' or 'no'. Please enter it again!"
msg_do_you_want_to_make_it_bootable="Do you want to mark it as bootable ?"

#
USAGE() {
   echo "Usage: $prog partition_device"
   echo "Ex:" 
   echo "To make /dev/sde1 bootable on GNU/Linux:"
   echo "  $prog /dev/sde1"
}
# Check if root or not
check_if_root() {
   if [ ! "$UID" = "0" ]; then
     echo
     echo "[$LOGNAME] You need to run this script \"`basename $0`\" as root."
     echo
     exit 1
   fi
}
#
to_continue_or_not() {
  local prompt_msg="$1"
  continue_choice=""
  while [ -z "$continue_choice" ]; do
    [ "$BOOTUP" = "color" ] && $SETCOLOR_WARNING
    echo "$prompt_msg"
    [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
    echo -n "[y/n] "
    read continue_choice 
    case "$continue_choice" in
         y|Y|[yY][eE][sS])
            echo "OK! Let's do it!" ;;
         n|N|[nN][oO])
            echo "Program terminated!"
            exit 1
            ;;
         *)
            [ "$BOOTUP" = "color" ] && $SETCOLOR_WARNING
            echo "$msg_you_have_to_enter_yes_or_no!"
            [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
            echo "--------------------------------------------"
            ;;
    esac
  done
} # end of to_continue_or_not
#
get_diskname() {
  local disk=${1#/dev/*}

  if [ -n "$disk" ]; then
    echo "$disk" | sed -e 's/^\([^0-9]*\)[0-9]*$/\1/g' \
                       -e 's/^\(.*[0-9]\{1,\}\)p[0-9]\{1,\}$/\1/g'
  fi
}
get_part_number() {
  local disk=${1#/dev/*}
  local num=""

  if [ -n "$disk" ]; then
    num=$(echo "$disk" | sed -e 's/^[^0-9]*\([0-9]*\)$/\1/g' \
                             -e 's/^.*[0-9]\{1,\}\(p[0-9]\{1,\}\)$/\1/g')
  fi

  echo $num
}

#
export LANG=C

#
check_if_root
target_part="$1"

#
if [ -z "$target_part" ]; then
  [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
  echo "No destination partition was assigned!"
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  USAGE
  exit 1
fi
if ! type parted &>/dev/null; then
  [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
  echo 'Program "parted" was not found on this GNU/Linux system. Please install it.'
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  echo "Program terminated!"
  exit 1
fi
if ! type blkid &>/dev/null; then
  [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
  echo 'Program "blkid" was not found on this GNU/Linux system. Please install it.'
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  echo "Program terminated!"
  exit 1
fi

# Make sure target_part is partition device name, not disk device name
if [ -z "$(echo $target_part | grep -iE "/dev/[hsu][bd][a-z]+[[:digit:]]+")" ]; then
  [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
  echo "\"$target_part\" is NOT a valid partition name!"
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  USAGE
  exit 1
fi

#
pt_dev="$(basename $target_part)"  # e.g. sdc1
hd_dev="$(get_diskname $target_part)"   # e.g. sdc
target_disk="/dev/$hd_dev"  # e.g. /dev/sdc
pt_dev_no="$(get_part_number $target_part)"  # e.g. 1

# If the destination disk is not MBR partition table (e.g. it's GPT), exit. This program only works for MBR disk.
if [ -z "$(LC_ALL=C parted -s $target_disk print | grep -iE "^Partition Table:" | grep -iE "msdos")" ]; then
  [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
  echo "The partition table of $target_disk is not for MBR (Master Boot Record). Its layout is:"
  LC_ALL=C parted -s $target_disk print
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  echo "This program is for making a bootable disk with MBR partition table."
  echo "For GPT disk, there is no need to run this program. Just make sure the partition is FAT32 with ID=ef00 and all the files are copied on that. That's all."
  echo "Program terminated!"
  exit 1
fi

# Get machine info:
on_this_machine=""
if type dmidecode &>/dev/null; then
  machine_name="$(LANG=C dmidecode -s system-product-name 2>/dev/null | head -n 1)"
  if [ -z "$machine_name" -o "$machine_name" = "To Be Filled By O.E.M." ]; then
    dev_model_shown="Unknown product name"
  else
    dev_model_shown="$machine_name"
  fi
fi
on_this_machine="on this machine \"$dev_model_shown\""

#
if ! grep -qEw $pt_dev /proc/partitions; then
  [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
  echo "$target_part was NOT found!"
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  echo "Available disk(s) and partition(s) $on_this_machine :"
  echo "--------------------------------------------"
  cat /proc/partitions
  echo "--------------------------------------------"
  echo "Program terminated!"
  exit 1
fi

#
[ "$BOOTUP" = "color" ] && $SETCOLOR_WARNING
echo "This command will install MBR and syslinux bootloader on this machine"
[ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
echo "--------------------------------------------"
[ "$BOOTUP" = "color" ] && $SETCOLOR_WARNING
echo "Machine: $dev_model_shown:"
[ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
fdisk -l $target_disk
echo "--------------------------------------------"

to_continue_or_not "$msg_are_u_sure_u_want_to_continue"
echo "--------------------------------------------"

# 0. Check if partition is a FAT partition or NTFS partition
# parted -s /dev/hda1 print
# Disk /dev/hda1: 8590MB
# Sector size (logical/physical): 512B/512B
# Partition Table: loop
# 
# Number  Start   End     Size    File system  Flags
#  1      0.00kB  8590MB  8590MB  fat32           
# part_fs="$(LC_ALL=C parted -s $target_disk print | grep -E "^[[:space:]]*${pt_dev_no}\>" | awk -F" " '{print $6}')"
blkinfo="$(mktemp /tmp/blkinfo.XXXXXX)"
LC_ALL=C blkid -c /dev/null $target_part | grep -o -E '\<TYPE="[^[:space:]]*"($|[[:space:]]+)' > $blkinfo
TYPE=""
. $blkinfo

echo "File system of $target_part: $TYPE"
case "$TYPE" in
  fat16|fat32|vfat)    mode="syslinux";;
  ntfs|ext[2-4]|btrfs) mode="extlinux";;
  *)                   
     [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
     echo "$target_part: this doesn't look like a valid FAT, NTFS, ext2/3/4 or btrfs file system."
     [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
     echo "Program terminated!"
     exit 1
     ;;
esac

echo "--------------------------------------------"
# 1. Check if partition start/end on cylinder boundary
# //NOTE// This is not really required. Comment it on Sep/21/2010.
#if [ -n "$(LANG=C fdisk -l $target_disk | grep -iE "(not start on cylinder boundary|not end on cylinder boundary)")" ]; then
#  [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
#  echo "Some partition does not start or end on cylinder boundary! This disk will not be able to boot via syslinux!" 
#  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
#  echo "Program terminated!"
#  exit 1
#fi

# 2. Bootable ?
bootable="$(LANG=C fdisk -l $target_disk | grep -Ew "^$target_part" | awk -F" " '{print $2}')"
if [ "$bootable" != "*" ]; then
  echo "$pt_dev is not marked as bootable! The partition table of $target_disk:"
  echo "--------------------------------------------"
  echo $dev_model_shown:
  fdisk -l $target_disk
  echo "--------------------------------------------"
  to_continue_or_not "$msg_do_you_want_to_make_it_bootable"
  echo "Running: parted -s $target_disk set $pt_dev_no boot on"
  parted -s $target_disk set $pt_dev_no boot on
  echo "--------------------------------------------"
fi

# 3. MBR
to_continue_or_not "Do you want to install mbr on $target_disk $on_this_machine ?"
echo Running: cat "$path_of_prog/utils/mbr/mbr.bin" > $target_disk
cat "$path_of_prog/utils/mbr/mbr.bin" > $target_disk

echo "--------------------------------------------"
# 4.
to_continue_or_not "Do you want to install the SYSLINUX bootloader on $target_part $on_this_machine ?"
# Since most of the cases when makeboot.sh is run, all the files are in FAT (USB flash drive normally uses FAT), we have to make syslinux executable.
echo "We need a filesystem supporting Unix file mode for syslinux. Copying syslinux from FAT to /tmp/..."
case "$mode" in
  syslinux)
     syslinux_tmpd="$(mktemp -d /tmp/syslinux_tmp.XXXXXX)"
     cp -fv "$path_of_prog/utils/linux/syslinux" $syslinux_tmpd
     chmod u+x $syslinux_tmpd/syslinux
     echo "Running: $syslinux_tmpd/syslinux -f -i $target_part "
     $syslinux_tmpd/syslinux -f -i $target_part
     echo "done!"
     [ "$BOOTUP" = "color" ] && $SETCOLOR_WARNING
     echo "//NOTE// If your USB flash drive fails to boot (maybe buggy BIOS), try to use \"syslinux -fs $target_part\", i.e. running with \"-s\"."
     [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
     [ -d "$syslinux_tmpd" -a -n "$(echo $syslinux_tmpd | grep "syslinux_tmp" )" ] && rm -rf $syslinux_tmpd
     ;;
  extlinux)
     extlinux_tmpd="$(mktemp -d /tmp/extlinux_tmp.XXXXXX)"
     cp -fv "$path_of_prog/utils/linux/extlinux" $extlinux_tmpd
     chmod u+x $extlinux_tmpd/extlinux
     # Check if $target_part is mounted or not
     mnt_pnt="$(LC_ALL=C df $target_part | grep -Ew $target_part | awk -F" " '{print $6}')"
     if [ -z "$mnt_pnt" ]; then
       # Not mounted. Mount it.
       ntfs_tmpd="$(mktemp -d /tmp/ntfs_tmp.XXXXXX)"
       mount $target_part $ntfs_tmpd
       rc=$?
     else
       # Already mounted. 
       ntfs_tmpd=$mnt_pnt
       rc=0
     fi
     if [ $rc -eq 0 ]; then
       echo "Running: $extlinux_tmpd/extlinux -i $ntfs_tmpd "
       $extlinux_tmpd/extlinux -i $ntfs_tmpd
       echo "done!"
     else
       [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
       echo "Failed to mount NTFS partition $target_part!"
       [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
       echo "Program terminated!"
       exit 1
     fi
     [ -d "$extlinux_tmpd" -a -n "$(echo $extlinux_tmpd | grep "extlinux_tmp" )" ] && rm -rf $extlinux_tmpd
     [ -d "$ntfs_tmpd" -a -n "$(echo $ntfs_tmpd | grep "ntfs_tmp" )" ] && rm -rf $ntfs_tmpd
     ;;
esac
