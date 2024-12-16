-- My default theme just in case
vim.cmd "colorscheme lunaperche"

-- Importing stuff down there

local imports = {
  "keymaps",
  "options",
  "plugins",
  "notify",
  "theme",
  "cmp",
  "bigfile",
  "lsp",
  "telescope",
--  "whichkey",
  "gitsigns",
  "toggleterm",
  "autopairs",
  "autotag",
  "treesitter",
  "surround",
  "neoformat",
  "luasnip",
--  "obsidian",
  "lualine",
}

for _,v in pairs(imports) do
  local ok, err = pcall(require, "user." .. v)

  if not ok then
    vim.notify("Something's wrong while loading: \"" .. v .. "\"\n\n")
    vim.notify(err) 
  end
end

