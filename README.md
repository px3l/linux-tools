# Linux Tools

A growing suite of scripts I find useful. Please see individual READMEs for useage.

## [01 - rename.sh](./readmes/rename.md)

This is a batch renaming script which will loop through a directory of files and rename them to an incrementing set of numbers.

## [02 - takeover.sh](./readmes/takeover.md)

This script is from https://github.com/marcan/takeover.sh

A script to completely take over a running Linux system remotely, allowing you to log into an in-memory rescue environment, unmount the original root filesystem, and do anything you want, all without rebooting. Replace one distro with another without touching a physical console.

## [03 - diskclone.sh](./readmes/diskclone.md)

This is a script which will create a complete carbon copy clone from disk 1 to disk 2 using the GNU dd command. It will clone the entire drive, including the MBR (and therefore bootloader), all partitions, UUIDs, and data.

## [04 - cloanallrepos.sh](./readmes/cloaneallrepos.md)

This script will clone all github repos for a user. Designed for git cloning all my personal repos should I reformat or get a new PC.