local ok, trouble = pcall(require, "trouble")

if not ok then
  print("Error while loading: trouble")
  vim.notify(trouble, "error", { title = "trouble" })
  return
end

trouble.setup({})
