#!/bin/bash

MDFILE=$1
PDFFILE=$(sed 's/\(.*\).md/\1.pdf/' <<< $MDFILE)
PDFFILE="$NOTES_DIR/pandoced/$PDFFILE"
TEXDIR="$NOTES_DIR/.head.tex"

echo $PDFFILE
pandoc --pdf-engine=pdflatex \
    --highlight-style tango \
    --toc \
    -N \
    -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" \
    -V mainfont="Jetbrains Mono" \
    -V subgraph \
    -H $TEXDIR \
    $MDFILE \
    -o $PDFFILE
