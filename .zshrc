export ZSH=/home/quizr/.oh-my-zsh
export EDITOR='vim'
export ZSH_TMUX_AUTOSTART=true
export ZSH_THEME="agnoster"

# http://unix.stackexchange.com/questions/94498/what-causes-this-green-background-in-ls-output
# http://stackoverflow.com/questions/23555836/getting-zsh-to-honor-dircolors-solarized
eval "$(dircolors ~/.dircolors)";

if [ -d "/mnt/d/Kod" ]
then
    alias Kod="cd /mnt/d/Kod/"
elif [ -d "/mnt/c/Kod" ]
then
    alias Kod="cd /mnt/c/Kod/"
fi

# MINTTY STUFF
# ctrl-left/right
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# ctrl-backspace/delete
bindkey "\C-_" backward-kill-word
bindkey "\e[3;5~" kill-word
# alt-backspace
bindkey "\e[3~" delete-char
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

alias scrawl="ssh terminal@underhound.eu"

#transfer.sh
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

plugins=(gitfast encode64 jsontools npm pip tmux)

source $ZSH/oh-my-zsh.sh