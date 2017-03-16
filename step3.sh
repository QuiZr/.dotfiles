#!/bin/sh

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files=".zshrc_custom .dircolors .gitconfig .ssh/config .ssh/underhoundeu .zpreztorc .zprofile"        # list of files/folders to symlink in homedir

##########

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
chmod 700 ~/.ssh/config
chmod 700 ~/.ssh/underhoundeu
chmod 700 ~/.ssh

echo "Enabling .zshrc_custom to run"
echo '\nsource ~/.zshrc_custom' >> ~/.zshrc

echo "Done! In order for the changes to take effect, please restart your terminal."
