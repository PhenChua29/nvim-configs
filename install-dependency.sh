#!/bin/sh

declare -a dependencies=(
  # lsp
  "typescript-language-server"
  "typescript" 

  # neoformat
  "prettier"
)

for i in "${dependencies[@]}"
do
  echo "Installing $i"
  npm i -g --verbose $i  
done
  
echo "Installed all dependencies!"

