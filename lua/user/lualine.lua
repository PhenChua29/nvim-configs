local ok, lualine = pcall(require, "lualine")

if not ok then
  print("Error while loading: lualine")
  vim.notify(lualine, "error", { title = "lualine" })
  return
end

local sections = {
  lualine_a = {},
  lualine_b = {"filename"},
  lualine_c = {},
  lualine_x = {"searchcount", "diagnostics"},
  lualine_y = {"diff", "progress", "branch"},
  lualine_z = {}
}

lualine.setup({
  sections = sections,
})
