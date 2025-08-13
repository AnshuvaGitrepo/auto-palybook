#!/bin/bash
set -e

echo "Uninstalling Fastfetch..."

# If installed via apt
if command -v fastfetch &>/dev/null; then
    if dpkg -l | grep -q fastfetch; then
        echo "Removing Fastfetch (apt)..."
        sudo apt-get remove --purge -y fastfetch
        sudo apt-get autoremove -y
    else
        echo "Fastfetch binary found but not an apt package."
    fi
else
    echo "Fastfetch command not found."
fi

# If installed from source in /usr/local
if [ -f "/usr/local/bin/fastfetch" ]; then
    echo "Removing Fastfetch binary from /usr/local..."
    sudo rm -f /usr/local/bin/fastfetch
fi

# If installed in user home dir
if [ -f "$HOME/.local/bin/fastfetch" ]; then
    echo "Removing Fastfetch binary from user local bin..."
    rm -f "$HOME/.local/bin/fastfetch"
fi

echo "Fastfetch uninstall complete!"
