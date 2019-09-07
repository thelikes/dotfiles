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

echo
printf $GREEN
echo "[*] Setup completed..."
printf $NORMAL

exit 0
