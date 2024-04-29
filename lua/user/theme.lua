-- Import and use color scheme
local themePlugin = "onedarkpro"
local themeName = "onedark"
themeName = "lunaperche"
local themeConf = {}

local ok, theme = pcall(require, themePlugin)
if not ok then
  vim.notify("Error while loading: " .. themePlugin)
  error(theme)
end

theme.setup(themeConf)

vim.cmd("colorscheme " .. themeName)
