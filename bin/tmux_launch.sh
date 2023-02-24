#!/bin/bash

if ! tmux has-session -t main; then

tmux new -s main -d
tmux rename-window -t main terminal

tmux new-window -t main
tmux rename-window -t main vim
tmux send-keys -t main 'vim' C-m

tmux new-window -t main
tmux rename-window -t main ssh:pi
tmux send-keys -t main 'ssh pi' C-m


tmux new-window -t main
tmux rename-window -t main ssh:tvinksonas
tmux send-keys -t main 'ssh tvinksonas' C-m

tmux select-window -t main:1
tmux attach -t main
else

tmux attach -t main

fi
