#!/bin/bash

echo "[+] Installing apt packages"
apt install i3-gaps rofi xorg xinit open-vm-tools open-vm-tools-desktop feh compton imagemagick lxappearance flameshot eog nautilus gnome-terminal evince snapd -y

echo "[+] Installing chromium"
systemctl start snapd.service
snap install chromium
ln -s /snap/bin/chromium /usr/bin
systemctl enable apparmor

echo "[+] Installing nerd-fonts"
git clone https://github.com/ryanoasis/nerd-fonts.git /opt/nerd-fonts
cd nerd-fonts
bash /opt/nerd-fonts/install.sh

echo "[+] Installing pywal"
pip3 install pywal

echo "[+] Done"

echo
echo "[!] To customize, setup ~/.config/{compton.conf,i3/config}, run rofi-theme-selector, and pywal"

exit 0