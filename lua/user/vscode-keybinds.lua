local opts = {
    noremap = true,
    silent = true
}
local preferedMode = {"n", "x"}
local keymap = {}

if vim.g.vscode then

  vscode = "<Cmd>lua require('vscode-neovim')."

  keymap = {
    -- Move between windows
    {preferedMode, "<C-j>", vscode .. "call('workbench.action.navigateDown')" .. "<CR>", opts},
    {preferedMode, "<C-k>", vscode .. "call('workbench.action.navigateUp')" .. "<CR>", opts},
    {preferedMode, "<C-h>", vscode .. "call('workbench.action.navigateLeft')" .. "<CR>", opts},
    {preferedMode, "<C-l>", vscode .. "call('workbench.action.navigateRight')" .. "<CR>", opts},

    -- Exit insert mode with jk
    {"i", "jk", "<ESC>", opts},

    -- Move text up and down in visual mode
    {preferedMode, "<A-j>", ":move +1" .. "<CR>", opts},
    {preferedMode, "<A-k>", ":move -2" .. "<CR>", opts},  
    
    -- Remove the double comments issue
    {preferedMode, "<C-/>", vscode .. "call('editor.action.commentLine')" .. "<CR>", opts},

    -- Trigger the whichkey extension
    {preferedMode, "<Space>", vscode .. "call('whichkey.show')" .. "<CR>", opts},

    -- Increase/decrease tab size
    {preferedMode, "<Up>", vscode .. "call('workbench.action.decreaseViewHeight')" .. "<CR>", opts},
    {preferedMode, "<Down>", vscode .. "call('workbench.action.increaseViewHeight')" .. "<CR>", opts},
    {preferedMode, "<Left>", vscode .. "call('workbench.action.decreaseViewWidth')" .. "<CR>", opts},
    {preferedMode, "<Right>", vscode .. "call('workbench.action.increaseViewWidth')" .. "<CR>", opts},
  }
else 
  keymap = {
    -- Move between windows
    {preferedMode, "<C-h>", "<C-w>h", opts},
    {preferedMode, "<C-j>", "<C-w>j", opts},
    {preferedMode, "<C-k>", "<C-w>k", opts},
    {preferedMode, "<C-l>", "<C-w>l", opts},

    -- Exit insert mode with jk
    {"i", "jk", "<ESC>", opts},

    -- Move text up and down in visual mode
    {preferedMode, "<A-j>", ":move +1" .. "<CR>", opts},
    {preferedMode, "<A-k>", ":move -2" .. "<CR>", opts},  
  }
end

-- Normal, visual, select

for k,v in pairs(keymap) do
  if type(v[1]) == "string" then
    vim.api.nvim_set_keymap(v[1], v[2], v[3], v[4])
    goto continue
  end

  for i, mode in pairs(v[1]) do
    vim.api.nvim_set_keymap(mode, v[2], v[3], v[4])
  end

  ::continue::
end


