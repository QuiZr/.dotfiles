#!/bin/sh
if ! type git > /dev/null; then
    sudo apt update
    sudo apt install git -y
fi

cd ~
git clone https://github.com/QuiZr/.dotfiles.git
cd ~/.dotfiles
. ~/.dotfiles/install.sh
