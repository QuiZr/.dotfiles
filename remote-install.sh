#!/bin/sh
sudo apt update
sudo apt install git -y
cd ~
git clone https://github.com/QuiZr/.dotfiles.git
cd .dotfiles
source install.sh
