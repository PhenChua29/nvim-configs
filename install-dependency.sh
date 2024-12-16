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
  pnpm i -g $i  
done
  
echo "Installed all dependencies!"

