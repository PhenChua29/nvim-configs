local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
  print("Error while loading: toggleterm")
  vim.notify(toggleterm, "error", { title = "toggleterm" })
  return
end

toggleterm.setup()
