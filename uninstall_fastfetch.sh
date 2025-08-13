#!/bin/bash
set -e

echo "=== Fastfetch Uninstall Script Started ==="

# Function to remove a file if it exists
remove_file() {
    if [ -f "$1" ]; then
        echo "Removing $1"
        sudo rm -f "$1"
    fi
}

# 1. Uninstall via apt (if installed this way)
if dpkg -l | grep -qw fastfetch; then
    echo "Fastfetch detected as an APT package. Removing..."
    sudo apt-get remove --purge -y fastfetch
    sudo apt-get autoremove -y
else
    echo "Fastfetch is not installed via APT."
fi

# 2. Remove manually installed binaries
remove_file "/usr/local/bin/fastfetch"
remove_file "$HOME/.local/bin/fastfetch"
remove_file "/usr/bin/fastfetch"

# 3. Remove source directories (optional, if you built from source)
if [ -d "$HOME/fastfetch" ]; then
    echo "Removing Fastfetch source directory..."
    rm -rf "$HOME/fastfetch"
fi

# 4. Verify removal
if command -v fastfetch &>/dev/null; then
    echo "WARNING: Fastfetch is still present. Manual cleanup may be required."
    which fastfetch
else
    echo "Fastfetch successfully uninstalled."
fi

echo "=== Fastfetch Uninstall Script Completed ==="
