#!/bin/bash

systemctl enable sddm.service

# Make yay from AUR
cd /opt
git clone https://aur.archlinux.org/yay.git
chown -R root:root yay
cd yay
makepkg -si --noconfirm

# Use yay to install calamares-git
yay -S --noconfirm calamares-git

# Clean up
cd /
rm -rf /opt/yay


