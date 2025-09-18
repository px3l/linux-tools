# takeover.sh

A script to take over a running Linux system remotely. This is from https://github.com/marcan/takeover.sh

## WARNING

⚠️ **EXTREMELY DANGEROUS** ⚠️

This script is experimental and can break your system. Only use it if:
- You understand exactly how it works
- You can afford to get physical access to fix problems
- You have tested it in a VM first
- You have an out-of-band way to reboot the system

## What it does

1. Takes over the init process of a running Linux system
2. Allows you to work in an in-memory rescue environment
3. Lets you unmount the original root filesystem
4. Enables system replacement without rebooting

## Prerequisites

1. Create `/takeover` directory and mount tmpfs on it
2. Extract a rescue environment (like SystemRescueCD) into `/takeover`
3. Add busybox to `/takeover/busybox`
4. Compile `fakeinit.c` and place it in `/takeover/fakeinit`
5. Run the script from `/takeover`

## Usage

```bash
cd /takeover
./takeover.sh
```

Follow the prompts. You'll need to:
1. Set a root password for SSH
2. Confirm when ready to continue
3. SSH into the secondary SSH daemon
4. Confirm the takeover

## After takeover

- Kill remaining old processes
- Unmount filesystems under `/old_root`
- Do your system modifications
- Reboot when done

**Remember: You MUST reboot when finished - there's no way back!**
