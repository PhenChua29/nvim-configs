local opts = { noremap = true, silent = true }
local maps = {
  -- Better navigation between windows
  { "n", "<C-h>", "<C-w>h", opts },
  { "n", "<C-j>", "<C-w>j", opts },
  { "n", "<C-k>", "<C-w>k", opts },
  { "n", "<C-l>", "<C-w>l", opts },

  -- let space key do nothing
  { "", "<Space>", "<Nop>", opts }, 
  
  -- Open explorer
  { "n", "<leader>e", ":Lex 20<CR>", opts },
  
  -- Pasting without yanking
  { "v", "p", '"_dP', opts },
  
  -- Resize windows
  { "n", "<Up>", ":resize -2<CR>", opts },
  { "n", "<Down>", ":resize +2<CR>", opts },
  { "n", "<Left>", ":vertical resize -2<CR>", opts },
  { "n", "<Right>", ":vertical resize +2<CR>", opts },
  
  -- Switch bettween buffers 
  { "n", "<S-l>", ":bnext<CR>", opts },
  { "n", "<S-h>", ":bprevious<CR>", opts },
  
  -- Move lines up/down
  { "n", "<A-j>", ":move .+1<CR>==", opts },
  { "n", "<A-k>", ":move .-2<CR>==", opts },
  { "i", "<A-j>", "<ESC>:move .+1<CR>==gi", opts },
  { "i", "<A-k>", "<ESC>:move .-2<CR>==gi", opts },
  { "v", "<A-j>", ":move '>+1<CR>gv=gv", opts },
  { "v", "<A-k>", ":move '<-2<CR>gv=gv", opts },

  -- Move line left/right
  { "v", "<", "<gv", opts },
  { "v", ">", ">gv", opts },
}

-- Ensure that the leader key is set to space before setting any keymaps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.api.nvim_set_keymap

for _, map in pairs(maps) do
  keymap(map[1], map[2], map[3], map[4])
end

-- Remove that annoying <C-l> keymap in netrw so that it cannot block the <C-l> keymap navigation

vim.cmd([[
  augroup netrw_mapping
    autocmd!
    autocmd Filetype netrw lua NetrwMapping()
  augroup END
]])

function NetrwMapping()
  vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", "<C-w>l", opts) 
end
