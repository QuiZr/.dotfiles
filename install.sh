#!/bin/sh

echo "--------------------------------------------------------------------------------"
echo "Setting language and locale"
echo "--------------------------------------------------------------------------------"
sudo update-locale LANG=en_US.UTF8
sudo update-locale LC_ALL=en_US.UTF8
sudo locale-gen --purge en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

echo "--------------------------------------------------------------------------------"
echo "Installing packages"
echo "--------------------------------------------------------------------------------"
sudo apt update
sudo apt install git wget zsh tmux vim -y
sudo apt upgrade -y
sudo apt-get autoremove --purge -y

echo "--------------------------------------------------------------------------------"
echo "Cloning oh-my-zsh"
echo "--------------------------------------------------------------------------------"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s $(which zsh)

echo "--------------------------------------------------------------------------------"
echo "Copying config files"
echo "--------------------------------------------------------------------------------"
# dotfiles directory
dir=~/.dotfiles

# old dotfiles backup directory
olddir=~/.dotfiles_old

# list of files/folders to symlink in homedir
files=".zshrc .vimrc .gitconfig .ssh/config .ssh/underhoundeu"

mkdir -p ~/.ssh
mkdir -p $olddir
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    mv ~/$file $olddir/ 2>/dev/null
    ln -s $dir/$file ~/$file
done

chmod 400 ~/.ssh/config
chmod 400 ~/.ssh/underhoundeu
chmod 400 ~/.ssh/id_rsa 2>/dev/null
chmod 700 ~/.ssh

echo "--------------------------------------------------------------------------------"
echo "Done! In order for the changes to take effect, please restart your terminal."
