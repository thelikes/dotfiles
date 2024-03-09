#!/bin/bash

if [ -z "$HOME" ]; then
    echo "\$HOME not set; aborting"
    exit 1
fi

if ! which curl >/dev/null; then
    echo "cURL not found; aborting"
    exit 1
fi

if ! which zsh >/dev/null; then
    echo "zsh not found; aborting"
    exit 1
fi

if ! which git >/dev/null; then
    echo "[!] git not found; aborting..."
    exit 1
fi

cp .tmux.conf $HOME/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

bash setup-zsh.sh
bash setup-vim.sh

exit 0