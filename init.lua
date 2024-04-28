-- My default theme just in case
vim.cmd "colorscheme lunaperche"

-- Importing stuff down there

local imports = {
  "user.options",
  "user.plugins",
  "user.keymaps"
}


for _,v in pairs(imports) do
  local ok, err = pcall(require, v)

  if not ok then
    print("Something's wrong while loading \"" .. v .. "\"\n\n")
    error(err) 
  return
  end
end

