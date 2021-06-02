#!/bin/bash

echo "[+] Installing apt packages"
apt install i3-gaps rofi xorg xinit open-vm-tools open-vm-tools-desktop feh compton imagemagick lxappearance flameshot eog nautilus gnome-terminal evince snapd -y

echo "[+] Installing chromium"
systemctl start snapd.service
snap install chromium
ln -s /snap/bin/chromium /usr/bin
systemctl enable apparmor
systemctl enable snapd.service

echo "[+] Installing nerd-fonts"
git clone https://github.com/ryanoasis/nerd-fonts.git /opt/nerd-fonts
cd nerd-fonts
bash /opt/nerd-fonts/install.sh

echo "[+] Installing pywal"
pip3 install pywal

echo "exec i3" > ~/.xsession

echo "[+] Installing sublime"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt update -y && apt install sublime-text -y

echo "[+] Done"

echo
echo "[!] To customize, setup ~/.config/{compton.conf,i3/config}, run rofi-theme-selector, and pywal"

exit 0