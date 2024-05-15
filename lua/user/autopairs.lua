local ok, autopairs = pcall(require, "nvim-autopairs")

if not ok then
  print("Error while loading: nvim-autopairs")
  vim.notify(autopairs, "error", { title = "nvim-autopairs" })
  return
end

autopairs.setup()
