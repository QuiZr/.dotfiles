#!/bin/sh
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt update
    sudo apt install git wget zsh
    sudo apt upgrade
    sudo apt-get autoremove --purge

git clone --recursive https://github.com/zsh-users/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Now run zsh, select 0 and run step2.sh."
