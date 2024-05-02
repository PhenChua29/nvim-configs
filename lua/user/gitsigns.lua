local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
  vim.notify("Error while loading: gitsigns")
  error(gitsigns)
end

gitsigns.setup()
