local ok, wk = pcall(require, "which-key")

if not ok then
  print("Error while loading: which-key.nvim")
  vim.notify(wk, "error", { title = "which-key" })
  return 
end

wk.register()
