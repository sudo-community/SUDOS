#!/bin/bash
#set -e

#systemctl enable sddm.service

# Create user with no password
#useradd -m -G wheel,audio,video,network,input,nopasswdlogin -s /bin/bash sudos
#gpasswd -a sudos nopasswdlogin

# Disable password for sudos
#passwd -d sudos

# Set up autologin via SDDM
#cat <<EOF > /etc/sddm.conf
#[Autologin]
#User=sudos
#Session=hyprland.desktop
#EOF
