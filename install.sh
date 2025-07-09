#!/usr/bin/env bash
# repro installer
set -e

# Download and install repro
echo "Installing repro..."
sudo curl -L https://github.com/stefan-hacks/repro/blob/main/repro.sh -o /usr/bin/repro
sudo chmod +x /usr/bin/repro

# Create config directory
mkdir -p ~/.config/repro/state ~/.config/repro/backups
touch ~/.config/repro/repro.log

# Initialize package state
echo "Initializing package database..."
repro --detect > /dev/null

echo -e "\n${GREEN}✓ repro installed successfully!${RESET}"
echo "Run 'repro --help' to get started"
