#!/bin/sh
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git wget zsh

git clone --recursive https://github.com/zsh-users/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Now run zsh, select 0 and run step2.sh."
