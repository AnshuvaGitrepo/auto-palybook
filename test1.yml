#!/bin/bash
set -e

# Update & enable backports repo
apt-get update
apt-get install -y curl

# Add Debian Backports for Bookworm
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free" | tee /etc/apt/sources.list.d/backports.list

# Update again and install fastfetch
apt-get update
apt-get install -y -t bookworm-backports fastfetch
