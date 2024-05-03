local ok, telescope = pcall(require, "telescope")

if not ok then
  vim.notify("Error while loading: telescope")
  error(telescope)
end

telescope.setup()

-- =========== Popup window appearance =========== 
local api = vim.api

api.nvim_set_hl(0, "TelescopeNormal", {}) 
api.nvim_set_hl(0, "TelescopeBorder", {}) 
