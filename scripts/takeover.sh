#!/bin/sh

# Simple system takeover script
# WARNING: This is dangerous and experimental!

TO=/takeover
OLD_TELINIT=/sbin/telinit
PORT=80

# Check if we're in the right directory
if [ ! -e fakeinit ]; then
    echo "Error: fakeinit not found. Please compile fakeinit.c first"
    exit 1
fi

cd "$TO"

echo "Setting up takeover environment..."

# Set root password
echo "Please set a root password for sshd"
chroot . /bin/passwd

# Setup filesystem
echo "Setting up target filesystem..."
rm -f etc/mtab
ln -s /proc/mounts etc/mtab
mkdir -p old_root

# Mount pseudo-filesystems
echo "Mounting pseudo-filesystems..."
mount -t tmpfs tmp tmp
mount -t proc proc proc
mount -t sysfs sys sys

if ! mount -t devtmpfs dev dev; then
    mount -t tmpfs dev dev
    cp -a /dev/* dev/
    rm -rf dev/pts
    mkdir dev/pts
fi
mount -t devpts devpts dev/pts

# Get current TTY
TTY="$(tty)"

echo "Checking and switching TTY..."
exec <"$TO/$TTY" >"$TO/$TTY" 2>"$TO/$TTY"

echo "Type 'OK' to continue"
echo -n "> "
read a
if [ "$a" != "OK" ]; then
    exit 1
fi

# Prepare init
echo "Preparing init..."
cp $OLD_TELINIT tmp/telinit
cat >tmp/init <<EOF
#!/bin/sh

exec <"${TO}/${TTY}" >"${TO}/${TTY}" 2>"${TO}/${TTY}"
cd "${TO}"

echo "Init takeover successful"
echo "Pivoting root..."
pivot_root . old_root
echo "Chrooting and running init..."
exec chroot . /fakeinit
EOF
chmod +x tmp/init

# Start SSH daemon
echo "Starting secondary sshd"
chroot . /usr/bin/ssh-keygen -A
chroot . /usr/sbin/sshd -p $PORT

echo "You should SSH into the secondary sshd now."
echo "Type OK to continue"
echo -n "> "
read a
if [ "$a" != "OK" ]; then
    exit 1
fi

echo "About to take over init. This script will now pause for a few seconds."
echo "If the takeover was successful, you will see output from the new init."

# Take over init
mount --bind tmp /sbin
tmp/telinit u
sleep 10