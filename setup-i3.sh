#!/bin/bash

# xorg
echo "[+] Installing Xorg"
apt install -y xorg xinit open-vm-tools open-vm-tools-desktop

# i3
echo "[+] Installing i3 packages"
apt install -y feh i3blocks i3status i3-gaps i3-gaps-wm lxappearance rofi compton papirus-icon-theme arandr arc-theme imagemagick

# qol
echo "[+] Installing QoL packages"
#apt install -y flameshot eog nautilus gnome-terminal evince snapd unclutter cargo
apt install -y flameshot eog nautilus gnome-terminal evince snapd

echo "[+] Installing nerd-fonts"
cd /opt/install
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ..

mkdir -p ~/.config/compton
mkdir -p ~/.config/i3

wget https://github.com/xct/kali-clean/raw/main/.config/compton/compton.conf  -O ~/.config/compton/compton.conf
wget https://github.com/xct/kali-clean/raw/main/.config/i3/i3blocks.conf -O ~/.config/i3/i3blocks.conf

echo "[+] Installing chromium"
systemctl start snapd.service
snap install chromium
ln -s /snap/bin/chromium /usr/bin
systemctl enable apparmor
systemctl enable snapd.service

echo "[+] Installing pywal"
pip3 install pywal

echo "exec i3" > ~/.xsession

echo "[+] Installing sublime"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt update -y && apt install sublime-text -y

echo "[+] Done"

echo
echo "[!] To customize, setup ~/.config/{compton.conf,i3/config}, run rofi-theme-selector, and pywal"

exit 0