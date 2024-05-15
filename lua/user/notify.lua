local ok, notify = pcall(require, "notify")

if not ok then
  print("Error while loading: notify", "error")
  vim.notify(notify, "error", { title = "notify" })
  return
end

notify.setup()
vim.notify = notify
