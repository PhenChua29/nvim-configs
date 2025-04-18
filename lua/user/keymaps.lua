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
  { "n", "<leader>e", ":Oil<CR>", opts },
  
  -- Pasting without yanking
  { "v", "p", '"_dP', opts },
  
  -- Resize windows
  { "n", "<Up>", ":sil resize -2<CR>", opts },
  { "n", "<Down>", ":sil resize +2<CR>", opts },
  { "n", "<Left>", ":sil vertical resize -2<CR>", opts },
  { "n", "<Right>", ":sil vertical resize +2<CR>", opts },
  
  -- Switch bettween buffers 
  { "n", "<S-l>", ":sil bnext<CR>", opts },
  { "n", "<S-h>", ":sil bprevious<CR>", opts },
  
  -- Move lines up/down
  { "n", "<A-j>", ":sil move .+1<CR>==", opts },
  { "n", "<A-k>", ":sil move .-2<CR>==", opts },
  { "i", "<A-j>", "<ESC>:sil move .+1<CR>==gi", opts },
  { "i", "<A-k>", "<ESC>:sil move .-2<CR>==gi", opts },
  { "v", "<A-j>", ":sil move '>+1<CR>gv=gv", opts },
  { "v", "<A-k>", ":sil move '<-2<CR>gv=gv", opts },

  -- Move line left/right
  { "v", "<", "<gv", opts },
  { "v", ">", ">gv", opts },

  -- Search
  { "n", "<leader>f", ":sil FzfLua files<CR>", opts },
  { "n", "<leader>s", ":sil FzfLua live_grep_glob<CR>", opts },
  { "n", "<leader>u", ":sil FzfLua grep_cword<CR>", opts },
  { "n", "<leader>p", ":sil Telescope commands<CR>", opts },

  -- Git
  { "n", "<leader>g", ":sil LazyGit<CR>", opts },

  -- Terminal
  { "n", "<leader>t", ":sil ToggleTerm direction=float<CR>", opts },
  { "t", "<leader>t", "<cmd>ToggleTermToggleAll<CR>", opts },
  { "t", "<C-\\>", "<C-\\><C-n>", opts },

  -- Appearance
  { "n", "<ESC>", ":sil noh<CR>", opts },

  -- Lsp
  { "n", "gi", ":sil lua vim.lsp.buf.implementation()<CR>", opts },
  { "n", "gd", ":sil lua vim.lsp.buf.definition()<CR>", opts },
  { "n", "gh", ":sil lua vim.lsp.buf.hover()<CR>", opts },

  -- Obsidian
  { "n", "<leader>op", "<cmd>ObsidianPasteImg<cr>", opts },

  -- auto-session
  { "n", "<leader>wr", "<cmd>SessionSearch<CR>", { noremap = true, silent = true, desc = "Session search" } },
  { "n", "<leader>ws", "<cmd>SessionSave<CR>", { noremap = true, silent = true, desc = "Save session" } },

  -- trouble
  
  { "n", "<leader>y", "<cmd>Trouble diagnostics toggle focus=false<cr>", opts },

  -- AI
  
  { "n", "<leader>c", "<cmd>CopilotChat<cr>", opts },

  -- =========== Editting =========== 

  -- Commenting
  { "n", "<leader>/", ":normal gcc<CR>", opts },
  { "v", "<leader>/", ":normal gcc<CR>", opts },

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
