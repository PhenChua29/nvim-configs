local ok, ibl = pcall(require, "ibl")

if not ok then
  print("Error while loading: ibl")
  vim.notify(ibl, "error", { title = "ibl" })
  return
end

ibl.setup()
