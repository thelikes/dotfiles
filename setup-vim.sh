#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
NORMAL="\033[0;39m"

dotfilesDir=~

printf $GREEN
echo "[*] Initializing..."
printf $NORMAL

if [[ -d ~/.vim ]] ; then
    printf $RED
    echo "[!] Directory ~/.vim exists. Aborting..."
    printf $NORMAL
    exit 1
fi

if [[ -f ~/.vimrc ]] ; then
    printf $RED
    echo "[!] File ~/.vimrc exists. Aborting..."
    printf $NORMAL
    exit 1
fi

echo
printf $GREEN
echo "[*] Installing rc file..."
printf $NORMAL
cp .vimrc ~/.vimrc

echo
printf $GREEN
echo "[*] Installing vundle and configured plugins..."
printf $NORMAL
mkdir -p $dotfilesDir/.vim/bundle
cd $dotfilesDir/.vim/bundle
git clone git://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall

echo 
printf $GREEN
echo "[!] Install ack !"
echo "      \`apt install ack-grep\`"
printf $NORMAL

echo
printf $GREEN
echo "[*] Setup completed..."
printf $NORMAL

exit 0
