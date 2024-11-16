-- See help in https://github.com/vscode-neovim/vscode-neovim
-- Great key bindings https://github.com/vscode-neovim/vscode-neovim?tab=readme-ov-file#keybindings-help

if not vim.g.vscode then
  vim.notify("vscode integration not detected")
  return
end

-- Importing stuff down there

-- lua files
local imports = {
  "user.vscode.options",
  "user.vscode-keybinds",
}

for _, v in pairs(imports) do
  local ok, err = pcall(require, v)

  if not ok then
    vim.notify("Something's wrong while loading \"" .. v .. "\"\n\n")
    error(err)
    return
  end
end

-- -- Vim scripts
-- local imports = {
--   "C:/Users/Admin/AppData/Local/nvim/vim/user/settings.vim"
-- }


-- for _, v in pairs(imports) do
--   --  local ok, err = pcall(vim.cmd, "source " .. v)
--   --
--   --  if not ok then
--   --    vim.notify("Something's wrong while loading \"" .. v .. "\"\n\n")
--   --    error(err)
--   --  return
--   --  end
--   vim.cmd("source " .. v)
-- end

local ok, vscode = pcall(require, "vscode-neovim");
if not ok then
  vim.notify("Error while loading: vscode-neovim")
  return
end

-- vscode.notify("Loaded neovim init file")
