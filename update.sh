#!/bin/bash

# Update system packages (Arch official repos)
echo "=== Updating system packages with pacman ==="
sudo pacman -Syu --noconfirm

# Update AUR packages with yay (if installed)
if command -v yay &>/dev/null; then
    echo "=== Updating AUR packages with yay ==="
    yay -Syu --noconfirm
else
    echo "yay not installed, skipping AUR update."
fi

# Update Flatpak packages (if installed)
if command -v flatpak &>/dev/null; then
    echo "=== Updating Flatpak apps ==="
    flatpak update -y
else
    echo "flatpak not installed, skipping Flatpak update."
fi

echo "=== All updates complete! ==="
