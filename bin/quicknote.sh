#!/bin/bash

filename="$NOTES_DIR/$(date +%Y%m%d)-quick.md"
if [[ ! -f "$filename" ]]; then
    echo "# Notes for $(date +%Y-%m-%d)" > $filename
fi

exec gnome-terminal -- \
    nvim -c "norm Go" \
    -c "norm Go## $(date +%H:%M)" \
    -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" $filename
