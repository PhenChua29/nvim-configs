local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
  vim.notify("Error while loading: gitsigns")
  error(gitsigns)
end

gitsigns.setup()

-- =========== Appearance =========== 
local api = vim.api

api.nvim_set_hl(0, "GitSignsChange", { fg = "#5fafff" })
