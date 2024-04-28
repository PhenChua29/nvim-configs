local opts = { noremap = true, silent = true }
local s_opts = { silent = true }
local maps = {
  { "n", "<C-h>", "<C-w>h", opts },
  { "n", "<C-j>", "<C-w>j", opts },
  { "n", "<C-k>", "<C-w>k", opts },
  { "n", "<C-l>", "<C-w>l", opts },
  { "", "<Space>", "<Nop>", opts }, -- let space key do nothing
  { "n", "<leader>e", ":Lex 20<cr>", opts }
}

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

for _, map in pairs(maps) do
  keymap(map[1], map[2], map[3], map[4])
end


