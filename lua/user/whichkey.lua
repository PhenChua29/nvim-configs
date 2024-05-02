local ok, wk = pcall(require, "which-key")

if not ok then
  vim.notify("Error while loading: which-key")
  error(wk)
end

wk.register()
