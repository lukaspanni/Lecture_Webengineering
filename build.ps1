$currentDir = Get-Location
if ($args.Length -ne 0) {
  $files = $args
  $zip = 0
}
else {
  $files = Get-ChildItem -Recurse -Path Material -Filter  *.md
  $zip = 1
}


foreach ($arg in $files) {
  $pdfName = "build/" + ((Get-Item $arg).Directory.Basename) + "/" + ((Get-Item $arg).Basename) + ".pdf"
  New-Item -ItemType Directory -Path (Split-Path $pdfName) -Force > $null
  pandoc -f markdown+smart+yaml_metadata_block+rebase_relative_paths --toc --slide-level 2 --number-section --pdf-engine lualatex -t beamer -H preamble.tex -F pandoc-plantuml -o $pdfName $arg
}

if ($zip){
  Set-Location .\build
  Compress-Archive -Force -Path .\* -DestinationPath ..\build.zip
  Set-Location $currentDir
}
