local ok, surround = pcall(require, "nvim-surround")

if not ok then
  print("Error while loading: nvim-surround")
  vim.notify(surround, "error", { title = "nvim-surround" })
  return
end

surround.setup()
