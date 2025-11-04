#!/usr/bin/env bash

srv () {
    HOST=$(cat ~/.ssh/config | grep -E '^Host ' | sed 's/^Host //' | fzf | awk  '{print $1}')
    if [[ -z $1 ]]; then
        ssh $HOST
    else
        $1 $HOST
    fi
}
