#!/usr/bin/env bash
# ~/.bashrc
# set -o vi
export PATH="$PATH:\
$HOME/.local/bin:\
$HOME/bin:\
$HOME/go/bin:\
$HOME/.cargo/bin:\
/usr/local/go/bin"

export VISUAL=vim

export PYTHONDONTWRITEBYTECODE=1
export PYTHONPYCACHEPREFIX=/tmp/pycache

. $HOME/bin/code.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="$(tput bold)$(tput setaf 1)$(tput setaf 3)[%n$(tput setaf 2)@$(tput setaf 4)%m $(tput setaf 5)%~$(tput setaf 1)]$(tput setaf 2)$(parse_git_branch)$(tput setaf 7) $(tput sgr0)"

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

# dotfiles managing alias inspired by https://news.ycombinator.com/item?id=11071754
#
# QUICK GUIDE:
# git init --bare $HOME/.dotfiles
# alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# dotfiles config status.showUntrackedFiles no
#
# WHEN ACCESSING FROM NEW MACHINE:
# git clone --separate-git-dir=$HOME/.dotfiles /path/to/repo $HOME/dotfiles-tmp
# cp ~/dotfiles-tmp/.gitmodules ~ If you use Git submodules
# rm -r ~/dotfiles-tmp/
# alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# unlimited bash history
export HISTSIZE=-1
export HISTFILESIZE=-1

#source /usr/share/doc/fzf/examples/key-bindings.bash
