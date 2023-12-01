#!/bin/bash

if [ $# -ne 0 ]
then
    zip=0
    files=$@
else
  zip=1
  files=$(find Material -type f -name "*.md" -printf "%p\n")
fi

for arg in $files
do
    pdfName="build/$(basename $(dirname $arg))/$(basename ${arg%%.*}.pdf)"
    mkdir -p "$(dirname $pdfName)"
    pdfType=$(dirname "$file")
    if [ "$pdfType" = "Slides" ]; then
      pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --slide-level 2 --number-section --pdf-engine lualatex -t beamer -H preamble.tex -F pandoc-plantuml -o $pdfName $arg &
    else
      pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --pdf-engine lualatex -F pandoc-plantuml -o "$pdfName" "$arg" &
    fi
done

wait

if (($zip)); then
  cd build
  zip -r ../build.zip .
fi
