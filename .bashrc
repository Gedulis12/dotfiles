# ~/.bashrc
# set -o vi
PATH="/home/gedas/.local/bin:$PATH"
PATH="/home/gedas/bin:$PATH"
PATH="/home/gedas/code/flutter/flutter/bin:$PATH"
PATH="/home/gedas/downloads/androidstudio/android-studio/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 2)\]$(parse_git_branch)\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]'

# Export locales for utf-8 support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Notes dir:
export NOTES_DIR=$HOME/Documents/notes
alias notes='cd $NOTES_DIR'

# Some useful aliases
alias la='ls -lah'
alias ll='ls -l'

# Source .bashrc file
alias bashs='source ~/.bashrc'

# get shareble link of stdout by piping to 'tb'
alias tb="nc termbin.com 9999"

# add colors to ls
alias ls='ls --color=auto'

# vim quicker
alias v='nvim'
alias vim='nvim'

# java aliases
alias javac18='/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/javac'
alias java18='/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin/java'

# dotfiles managing alias inspired by https://news.ycombinator.com/item?id=11071754
#
# QUICK GUIDE:
# git init --bare $HOME/.myconf
# alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
# config config status.showUntrackedFiles no
#
# WHEN ACCESSING FROM NEW MACHINE:
# git clone --separate-git-dir=$HOME/.myconf /path/to/repo $HOME/myconf-tmp
# cp ~/myconf-tmp/.gitmodules ~ If you use Git submodules
# rm -r ~/myconf-tmp/
# alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
#
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
