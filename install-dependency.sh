#!/bin/sh

declare -a dependencies=(
  # lsp
  "typescript-language-server"
  "typescript" 
  "vscode-langservers-extracted"
  "@ansible/ansible-language-server"
  "@tailwindcss/language-server"

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

