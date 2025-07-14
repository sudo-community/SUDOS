#!/bin/bash
set -e

systemctl enable sddm.service

# Create user with no password
useradd -m -G wheel,audio,video,network,input,nopasswdlogin -s /bin/bash sudos
gpasswd -a sudos nopasswdlogin

# Disable password for sudos
passwd -d sudos

# Set up autologin via SDDM
cat <<EOF > /etc/sddm.conf
[Autologin]
User=sudos
Session=hyprland.desktop
EOF

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


