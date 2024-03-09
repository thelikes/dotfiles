#!/bin/bash

if [ -z "$HOME" ]; then
    echo "\$HOME not set; aborting"
    exit 1
fi

if [[ -d $HOME/.vim ]] ; then
    echo "[!] Directory ~/.vim exists. Aborting..."
    exit 1
fi

if [[ -f $HOME/.vimrc ]] ; then
    echo "[!] File ~/.vimrc exists. Aborting..."
    exit 1
fi

if ! which git >/dev/null; then
    echo "[!] git not found; aborting..."
    exit 1
fi

cp .vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

exit 0
