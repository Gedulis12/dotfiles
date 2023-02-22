#
# ~/.bashrc
#
# set -o vi
PATH="/home/gedas/.local/bin:$PATH"
PATH="/home/gedas/.scripts:$PATH"
PATH="/home/gedas/code/flutter/flutter/bin:$PATH"
PATH="/home/gedas/downloads/androidstudio/android-studio/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 2)\]$(parse_git_branch)\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]'
#PS1="\[$(tput bold)\]\[\033[38;5;6m\]\u\[$(tput bold)\]\[\033[38;5;5m\]@\[$(tput bold)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;6m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;5m\]\\$\[$(tput sgr0)\]"
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)

#cowpath file
COWPATH="$COWPATH:$HOME/.cowsay/cowfiles"

# Export locales for utf-8 support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Markdown syntax support for less:
export LESSOPEN="lessopen %s"
export LESSCLOSE="lessclose %s %s"

# Notes dir:
export NOTES_DIR=$HOME/Documents/notes
alias notes='cd $NOTES_DIR'

# Some useful aliases
alias la='ls -lah'
alias ll='ls -l'
alias i3config='vim ~/.config/i3/config'

# Source .bashrc file
alias bashs='source ~/.bashrc'

# get shareble link of stdout by piping to 'tb'
alias tb="nc termbin.com 9999"

# add colors to ls
alias ls='ls --color=auto'


# Backup dotfiles
alias dotb='cd $HOME/.dotfiles/ && $HOME/.dotfiles/backup.sh && cd -'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias v='nvim'
alias vim='nvim'

alias javac18='/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/javac'
alias java18='/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/java'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
