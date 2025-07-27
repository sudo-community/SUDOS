userdel -r sudos 2>/dev/null || true
pacman -Rns --noconfirm calamares
rm -rf /etc/calamares
