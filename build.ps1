foreach ($arg in $args) {
  $pdfName = ((Get-Item $arg).Basename) + ".pdf"
  pandoc -f markdown+smart+yaml_metadata_block --toc --slide-level 2 --number-section --pdf-engine lualatex -t beamer -H preamble.tex -o $pdfName $arg
}
