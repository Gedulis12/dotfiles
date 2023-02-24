#!/bin/bash

quicknote () {
    filename="$NOTES_DIR/quick/$(date +%Y%m%d)-quick.md"
    if [[ ! -f "$filename" ]]; then
        echo "# Notes for $(date +%Y-%m-%d)" > $filename
    fi

    nvim -c "norm Go" \
        -c "norm Go## $(date +%H:%M)" \
        -c "norm G2o" \
        -c "norm zz" \
        -c "startinsert" $filename
}

regularnote () {
    filename="$NOTES_DIR/$1.md"
    if [[ ! -f "$filename" ]]; then
        echo "---" >> $filename
        echo "Title: $1" >> $filename
        echo "Links: " >> $filename
        echo "Tags: []" >> $filename
        echo "---" >> $filename
        nvim $filename
    else
        read -p 'note with this name already exists, do you want to open it (Y)? ' open
        if [ $open == "y" ] || [ $open == "Y" ]; then
            nvim $filename
        fi
    fi
}

if [[ ! -z $1 ]]
then
    regularnote $1
else
    quicknote
fi
