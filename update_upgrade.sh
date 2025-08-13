#!/bin/bash
set -e

echo "Updating and upgrading system packages..."
sudo apt-get update -y && sudo apt-get upgrade -y
echo "System update complete!"
