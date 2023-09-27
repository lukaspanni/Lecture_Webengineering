#!/bin/bash

for arg in "$@"
do
    pandoc -f markdown+smart+yaml_metadata_block --toc --slide-level 2 --number-section --pdf-engine lualatex -t beamer -H preamble.tex -o ${arg%%.*}.pdf $arg
done
