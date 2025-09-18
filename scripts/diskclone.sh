#!/bin/bash

# Simple disk cloning script
# Usage: sudo ./diskclone.sh <source_disk> <target_disk>

DISK_1="${DISK_1:-$1}"
DISK_2="${DISK_2:-$2}"

# Check arguments
if [ -z "$DISK_1" ] || [ -z "$DISK_2" ]; then
    echo "Usage: $0 <source_disk> <target_disk>"
    echo "Example: $0 /dev/sda /dev/sdb"
    exit 1
fi

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root"
    echo "Use: sudo $0 $DISK_1 $DISK_2"
    exit 1
fi

# Check if disks exist
if [ ! -b "$DISK_1" ]; then
    echo "Error: $DISK_1 is not a valid block device"
    exit 1
fi

if [ ! -b "$DISK_2" ]; then
    echo "Error: $DISK_2 is not a valid block device"
    exit 1
fi

# Warning
echo "WARNING: This will completely overwrite $DISK_2!"
echo "All data on $DISK_2 will be permanently lost!"
echo
read -p "Are you sure you want to continue? (type 'yes' to confirm): " confirmation

if [ "$confirmation" != "yes" ]; then
    echo "Operation cancelled"
    exit 0
fi

echo "Cloning $DISK_1 to $DISK_2..."
echo "This may take a while..."

# Clone the disk
dd if="$DISK_1" of="$DISK_2" bs=64K status=progress

echo "Clone complete!"