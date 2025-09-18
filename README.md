# Linux Tools

A growing suite of scripts I find useful. Please see individual READMEs for usage.

## [01 - rename.sh](./readmes/rename.md)

This is a batch renaming script which will loop through a directory of files and rename them to an incrementing set of numbers.

## [02 - takeover.sh](./readmes/takeover.md)

This script is from https://github.com/marcan/takeover.sh

A script to completely take over a running Linux system remotely, allowing you to log into an in-memory rescue environment, unmount the original root filesystem, and do anything you want, all without rebooting. Replace one distro with another without touching a physical console.

## [03 - diskclone.sh](./readmes/diskclone.md)

A robust disk cloning script that creates a complete carbon copy of a disk using GNU dd with comprehensive safety checks and progress indication.

### Quick Usage

```bash
# Basic disk cloning
sudo ./scripts/diskclone.sh /dev/sda /dev/sdb

# With custom block size
sudo ./scripts/diskclone.sh /dev/sda /dev/sdb 131072

# Show help
./scripts/diskclone.sh --help
```

### Features
- **Safety checks**: Validates block devices, checks for mounted targets, requires root privileges
- **Progress indication**: Uses `pv` (pipe viewer) if available, falls back to dd's status=progress
- **Verification**: Automatically verifies the clone using SHA256 checksums
- **User-friendly**: Colored output, clear error messages, and confirmation prompts

⚠️ **WARNING**: This will completely overwrite the target disk! Make sure you have backups.

## [04 - cloneallrepos.sh](./readmes/cloneallrepos.md)

This script will clone all github repos for a user. Designed for git cloning all my personal repos should I reformat or get a new PC.

## [05 - updater.sh](./readmes/updater.md)

This script will update your Linux distro.