local ok, telescope = pcall(require, "telescope")

if not ok then
  print("Error while loading: telescope.nvim")
  vim.notify(telescope, "error", { title = "telescope" })
  return
end

telescope.setup()

-- =========== Popup window appearance =========== 
local api = vim.api

api.nvim_set_hl(0, "TelescopeNormal", {}) 
api.nvim_set_hl(0, "TelescopeBorder", {}) 
