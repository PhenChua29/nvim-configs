#!/bin/sh

declare -a dependencies=(
  # lsp
  "typescript-language-server"
  "typescript" 
  "vscode-langservers-extracted"

  # neoformat
  "prettier"

  # treesitter cli
  "tree-sitter-cli"
)

for i in "${dependencies[@]}"
do
  echo "Installing $i"
  npm i -g --verbose $i  
done
  
echo "Installed all dependencies!"

