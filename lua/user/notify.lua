local ok, notify = pcall(require, "notify")

if not ok then
  print("Error while loading: notify", "error")
  vim.notify(notify, "error", { title = "notify" })
  return
end

notify.setup({
  background_colour = "#000000",
})

vim.notify = notify
