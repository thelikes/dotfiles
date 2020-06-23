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

zshrc="$(echo $HOME)/.zshrc"

# exports
echo "export TERM=xterm-256color" >> $zshrc
echo "export UA='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'" >> $zshrc

# aliases
echo "alias lss='ls -ltr'" >> $zshrc
echo "alias s='git status'" >> $zshrc
echo "alias P='git pull origin master'" >> $zshrc
echo "alias p='git push origin master'" >> $zshrc
echo "alias ipa='ip --brief --color a'" >> $zshrc
echo "alias ips='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 -u'" >> $zshrc
echo "alias af='assetfinder -subs-only'" >> $zshrc
echo "alias fn='fuzznav'" >> $zshrc

# ftns
echo 'ipinfo () { curl ipinfo.io/$1 }' >> $zshrc
echo "searchip () { searchip=$(echo $1 | sed 's/\./\\\./g')" >> $zshrc

echo
printf $GREEN
echo "[*] Setup completed..."
printf $NORMAL

exit 0
