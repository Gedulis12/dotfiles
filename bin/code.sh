#!/bin/bash

function code() {
    project=$(find $CODE -type d -name ".git" -prune 2>/dev/null | awk -F"\.git" '{ print $1 }' | fzf)
    cd $project
}
