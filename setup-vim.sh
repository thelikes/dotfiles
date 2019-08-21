#!/bin/bash

dotfilesDir=~

echo "[*] Initializing..."

if [[ -d ~/.vim ]] ; then
    echo "[!] Directory ~/.vim exists. Aborting..."
    exit 1
fi

if [[ -f ~/.vimrc ]] ; then
    echo "[!] File ~/.vimrc exists. Aborting..."
    exit 1
fi

echo
echo "[*] Installing rc file..."
cp .vimrc ~/.vimrc

echo
echo "[*] Installing vundle and configured plugins..."
mkdir -p $dotfilesDir/.vim/bundle
cd $dotfilesDir/.vim/bundle
git clone git://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall

echo 
echo "[!] Install ack !"
echo "      \`apt install ack-grep\`"

echo
echo "[*] Setup completed..."

exit 0
