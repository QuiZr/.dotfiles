export ZSH=/home/$USER/.oh-my-zsh
export EDITOR='vim'
export ZSH_TMUX_AUTOSTART=true
export ZSH_THEME="gentoo"

if [ -d "/mnt/d/Kod" ]
then
    alias Kod="cd /mnt/d/Kod/"
elif [ -d "/mnt/c/Kod" ]
then
    alias Kod="cd /mnt/c/Kod/"
fi

alias scrawl="ssh terminal@underhound.eu"

#transfer.sh
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

plugins=(git gitfast encode64 tmux ssh-agent)

source $ZSH/oh-my-zsh.sh
