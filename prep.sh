#!/bin/sh

if hash apt-get 2>/dev/null; then
    if hash add-apt-repository 2>/dev/null; then
        sudo add-apt-repository ppa:git-core/ppa
    fi
    sudo apt-get update
    sudo apt-get install git wget zsh
else
    sudo zypper install zsh git wget
fi

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
