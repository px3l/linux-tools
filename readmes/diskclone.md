# diskclone.sh

A simple script to clone a disk using dd.

## Usage

```bash
sudo ./diskclone.sh <source_disk> <target_disk>
```

## Examples

```bash
# Clone /dev/sda to /dev/sdb
sudo ./diskclone.sh /dev/sda /dev/sdb

# Using environment variables
sudo DISK_1=/dev/sda DISK_2=/dev/sdb ./diskclone.sh
```

## What it does

1. Checks that both disks exist and are valid block devices
2. Requires root privileges
3. Shows a warning about data loss
4. Clones the entire disk using dd with progress indication

## Warnings

⚠️ **DANGER**: This will completely overwrite the target disk!
- All data on the target disk will be permanently lost
- Make sure you have backups of any important data
- Double-check that you're specifying the correct source and target disks