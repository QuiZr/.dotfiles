#!/bin/sh
echo "Setting language"
sudo update-locale LANG=en_US.UTF8
sudo update-locale LC_ALL=en_US.UTF8
sudo locale-gen --purge en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

echo "----------------------------------------"
echo "Installing packages"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install git wget zsh tmux -y
sudo apt upgrade -y
sudo apt-get autoremove --purge -y

echo "----------------------------------------"
echo "Installing oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "----------------------------------------"
echo "Copying config files"
dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files=".zshrc .dircolors .vimrc .gitconfig .ssh/config .ssh/underhoundeu"        # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

echo "Creating nessesery folders"
mkdir ~/.ssh

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

echo "Setting permissions of ssh config and keys."
chmod 400 ~/.ssh/config
chmod 400 ~/.ssh/underhoundeu
chmod 400 ~/.ssh/id_rsa
chmod 500 ~/.ssh

echo "Done! In order for the changes to take effect, please restart your terminal."
