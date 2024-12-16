local ok, oil = pcall(require, "oil")

if not ok then
  print("Error while loading: Oil")
  vim.notify(oil, "error", { title = "Oil" })
  return
end

oil.setup()
