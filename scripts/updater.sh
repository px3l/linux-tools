#!/bin/bash

# Simple Linux system updater
# Usage: sudo ./updater.sh

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root"
    echo "Use: sudo $0"
    exit 1
fi

echo "Updating package lists..."
apt-get update

echo "Upgrading packages..."
apt-get upgrade -y

echo "Upgrading distribution..."
apt-get dist-upgrade -y

echo "Cleaning up..."
apt-get autoremove -y
apt-get autoclean

echo "Update complete!"