# Testing the Takeover Script Safely

## ⚠️ WARNING
The takeover script is extremely dangerous and can break your system. Only test it in a safe environment.

## Safe Testing Methods

### 1. Virtual Machine (Recommended)

**Setup:**
```bash
# Create a VM with a sysvinit-based Linux distro
# Good options: Debian with sysvinit, Alpine Linux, or older Ubuntu

# In the VM, create the takeover environment:
sudo mkdir /takeover
sudo mount -t tmpfs tmpfs /takeover

# Download and extract a rescue environment
# (SystemRescueCD, Alpine Linux, etc.)
# Extract to /takeover

# Add busybox
wget https://www.busybox.net/downloads/binaries/1.26.2-defconfig-multiarch/busybox-x86_64
sudo cp busybox-x86_64 /takeover/busybox
sudo chmod +x /takeover/busybox

# Compile fakeinit.c
sudo gcc fakeinit.c -o /takeover/fakeinit

# Test the script
cd /takeover
sudo ./takeover.sh
```

### 2. Test Script (Safe)

Run the test version to see what would happen:
```bash
./takeover-test.sh
```

### 3. Syntax Check

Check the script syntax:
```bash
bash -n takeover.sh
```

## Prerequisites for Real Testing

1. **System with sysvinit** (not systemd)
2. **Rescue environment** (SystemRescueCD, Alpine, etc.)
3. **Busybox binary**
4. **Compiled fakeinit.c**
5. **Physical access** to the system (in case something goes wrong)

## What the Script Does

1. Sets up a rescue environment in `/takeover`
2. Mounts pseudo-filesystems
3. Starts a secondary SSH daemon
4. Takes over the init process
5. Allows you to work in the rescue environment

## Recovery

If something goes wrong:
- Use physical access to reboot
- Use out-of-band management (IPMI, etc.)
- Boot from rescue media

**Remember: Always test in a VM first!**
