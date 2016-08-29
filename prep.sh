if apt-get >/dev/null; then
    sudo apt-get install zsh git wget;
else
    sudo zypper install zsh git wget;
fi
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
