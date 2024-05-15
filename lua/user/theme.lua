-- Import and use color scheme
local themePlugin = "onedarkpro"
local themeName = "onedark"
local themeConf = {}

local ok, theme = pcall(require, themePlugin)
if not ok then
  print("Error while loading: " .. themePlugin)
  vim.notify(theme, "error", { title = "theme" })
end

theme.setup(themeConf)

vim.cmd("colorscheme " .. themeName)
