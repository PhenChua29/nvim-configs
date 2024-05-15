local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
  print("Error while loading: gitsigns")
  vim.notify(gitsigns, "error", { title = "gitsigns" })
  return
end

gitsigns.setup()

-- =========== Appearance =========== 
local api = vim.api

api.nvim_set_hl(0, "GitSignsChange", { fg = "#5fafff" })
