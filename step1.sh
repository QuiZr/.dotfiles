#!/bin/sh
#force en_US.UTF-8 language
sudo update-locale LANG=en_US.UTF8
sudo update-locale LC_ALL=en_US.UTF8
sudo locale-gen --purge en_US.UTF8

#install packages
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git wget zsh
sudo apt upgrade
sudo apt-get autoremove --purge

git clone --recursive https://github.com/zsh-users/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Now run zsh, select 0 and run step2.sh."
