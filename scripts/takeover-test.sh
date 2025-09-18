#!/bin/sh

# Test version of takeover.sh - shows what it would do without actually doing it
# This is SAFE to run - it only shows the steps

echo "=== TAKEOVER SCRIPT TEST MODE ==="
echo "This shows what the takeover script would do without actually doing it"
echo

TO=/takeover
OLD_TELINIT=/sbin/telinit
PORT=80

echo "1. Checking prerequisites..."
if [ ! -e fakeinit ]; then
    echo "   ❌ fakeinit not found - would exit here"
    echo "   Need to compile fakeinit.c first"
    exit 1
else
    echo "   ✅ fakeinit found"
fi

echo
echo "2. Would change to directory: $TO"
echo "   (Current directory: $(pwd))"

echo
echo "3. Would set root password for sshd"
echo "   Command: chroot . /bin/passwd"

echo
echo "4. Would setup filesystem:"
echo "   - Remove etc/mtab"
echo "   - Create symlink to /proc/mounts"
echo "   - Create old_root directory"

echo
echo "5. Would mount pseudo-filesystems:"
echo "   - tmpfs on tmp"
echo "   - proc on proc"
echo "   - sysfs on sys"
echo "   - devtmpfs on dev (or tmpfs fallback)"
echo "   - devpts on dev/pts"

echo
echo "6. Would get current TTY: $(tty)"

echo
echo "7. Would redirect stdio to TTY"

echo
echo "8. Would ask for confirmation to continue"

echo
echo "9. Would prepare init script in tmp/init"

echo
echo "10. Would start SSH daemon on port $PORT"

echo
echo "11. Would ask for second confirmation"

echo
echo "12. Would take over init process:"
echo "    - Mount tmp over /sbin"
echo "    - Run telinit u"
echo "    - Sleep 10 seconds"

echo
echo "=== END OF TEST ==="
echo "This is what the real takeover.sh would do"
echo "DO NOT run the real script unless you understand the risks!"
