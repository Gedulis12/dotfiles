#!/bin/bash

#      __ __     __         __    
#   __/ // /_   / /_  ___  / /___ 
#  /_  _  __/  / __ \/ _ \/ / __ \
# /_  _  __/  / / / /  __/ / /_/ /
#  /_//_/    /_/ /_/\___/_/ .___/ 
#                        /_/      

help () {
    echo 'The program searches for .md files through notes directory'
    echo 'Notes directory must be specified as $NOTES_DIR environment variable'
    echo 'Options:'
    echo '-h    Prints this message'
    echo ''
    echo '-t    Filters notes on tags. Tags must be specified in metadata block like this: '
    echo '      Tags: [tag1, tag2, tag3]'
    echo ''
    echo '-g    Uses grep to search through notes, usage:'
    echo '      findnotes.sh -g searchpattern'
}

#      __ __                     _                                                    
#   __/ // /_   ____ ___  ____ _(_)___     ____  _________  ____ __________ _____ ___ 
#  /_  _  __/  / __ `__ \/ __ `/ / __ \   / __ \/ ___/ __ \/ __ `/ ___/ __ `/ __ `__ \
# /_  _  __/  / / / / / / /_/ / / / / /  / /_/ / /  / /_/ / /_/ / /  / /_/ / / / / / /
#  /_//_/    /_/ /_/ /_/\__,_/_/_/ /_/  / .___/_/   \____/\__, /_/   \__,_/_/ /_/ /_/ 
#                                      /_/               /____/                       

get_tag () {
    tag=$( \
        grep -aHri 'tags: \[' $NOTES_DIR/* | \
        cut -d ":" -f 3 | \
        sed -e 's/[][,]//g' | \
        tr ' ' '\n' | \
        grep "\S" | \
        sort -u | \
        fzf --preview=' \
        grep -aHrie "^Tags: \[.*\]$" $NOTES_DIR/* | \
        grep -i {} | \
        cut -d ":" -f 1 | \
        sort -u' \
        --bind shift-up:preview-page-up,shift-down:preview-page-down \
    )
}

search_by_tag() {
    get_tag
    if [[ ! -z "$tag" ]]
    then
        notefile=$( \
            grep -aHrie "^Tags: \[.*$tag.*\]\$" $NOTES_DIR/* | \
            cut -d ":" -f 1 | \
            sort -u | \
            fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down \
        )
    fi

    if [[ ! -z "$notefile" ]]
    then
        nvim $notefile
    fi
}

search_by_filename() {
    notefile=$(find $NOTES_DIR -type f -name '*.md' -exec ls {} + | fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down)
    if [[ ! -z "$notefile" ]]
    then
        nvim $notefile
    fi
}

search_by_grep() {
    file=$(grep --include "*md" -aHri $1 $NOTES_DIR | \
        cut -d ':' -f 1 | \
        sort -u | \
        fzf --preview='less {}' \
        --bind shift-up:preview-page-up,shift-down:preview-page-down
    )
    if [[ ! -z "$file" ]]
    then
        nvim $file
    fi
}

while getopts ":thg:" options; do
    case $options in
        t) # search on tags
            search_by_tag
            exit;;
        g) # search on tags
            search_by_grep $OPTARG
            exit;;
        h) # display Help
            help
            exit;;
        \?) # invalid option
            echo "Error: Invalid option"
            exit 1
    esac
done

search_by_filename
