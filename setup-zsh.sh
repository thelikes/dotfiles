#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
NORMAL="\033[0;39m"

dotfilesDir=~

printf $GREEN
echo "[*] Initializing..."
printf $NORMAL

# grab a random theme and modify the config file
ran_theme=$(ls ~/.oh-my-zsh/themes | sed 's/\.zsh-theme//g' | shuf -n 1)
sed -i "s/robbyrussell/$ran_theme/g" ~/.zshrc

echo "export TERM=xterm-256color\nalias lss='ls -ltr'\nalias s='git status'\nalias P='git pull origin master'\nalias p='git push origin master'\nalias ipa='ip --brief --color a'\nalias ips='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 -u'" >> ~/.zshrc

echo
printf $GREEN
echo "[*] Setup completed..."
printf $NORMAL

exit 0
