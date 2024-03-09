#!/bin/bash

dotfilesDir=~

echo "[*] Initializing..."

# grab a random theme and modify the config file
ran_theme=$(ls ~/.oh-my-zsh/themes | sed 's/\.zsh-theme//g' | shuf -n 1)
sed -i "s/robbyrussell/$ran_theme/g" ~/.zshrc

zshrc="$(echo $HOME)/.zshrc"

# exports
echo "export TERM=xterm-256color" >> $zshrc
echo "export UA='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.3'" >> $zshrc
echo 'export ff="ffuf -c -u \$targ/FUZZ -w \$list -o ffuf-\$(basename \$list)-\$(echo \$targ | sed '"'s/:\/\//\./g' | sed 's/\//_/g').json"' -t 10 -H \"User-Agent: \$UA\" -mc all -ac"' >> $zshrc

# aliases
echo "alias lss='ls -ltr'" >> $zshrc
echo "alias s='git status'" >> $zshrc
echo "alias P='git pull origin main'" >> $zshrc
echo "alias p='git push origin main'" >> $zshrc
echo "alias ipa='ip --brief --color a'" >> $zshrc
echo "alias ips='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 -u'" >> $zshrc
echo "alias af='assetfinder -subs-only'" >> $zshrc
echo "alias fn='fuzznav'" >> $zshrc
echo "alias searchip=$(echo $1 | sed 's/\./\\\./g')" >> $zshrc
echo "alias lil=\"tr '[:upper:]' '[:lower:]'\"" >> $zshrc
echo "alias big=\"tr '[:lower:]' '[:upper:]'\"" >> $zshrc
echo "alias wb64='iconv -f UTF8 -t UTF16LE | base64 -w 0 ; echo'" >> $zshrc

# ftns
echo 'ipinfo () { curl -s https://ipinfo.io/$1 | jq }' >> $zshrc
echo 'weakpass () { curl http://weakpasswords.net/ }' >> $zshrc
echo 'preexec() {echo $(date -u +"%Y-%m-%d %H:%M:%S GMT"); echo " "}' >> $zshrc

echo
echo "[*] Setup completed..."

exit 0
