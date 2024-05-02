-- My default theme just in case
vim.cmd "colorscheme lunaperche"

-- Importing stuff down there

local imports = {
  "user.keymaps",
  "user.options",
  "user.plugins",
  "user.theme",
  "user.cmp",
  "user.bigfile",
  "user.lsp",
  "user.telescope",
  "user.whichkey",
  "user.gitsigns",
}

for _,v in pairs(imports) do
  local ok, err = pcall(require, v)

  if not ok then
    vim.notify("Something's wrong while loading \"" .. v .. "\"\n\n")
    error(err) 
    return
  end
end

