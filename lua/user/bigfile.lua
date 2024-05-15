local ok, bigfile = pcall(require, "bigfile")

if not ok then
  print("Error while loading: bigfile.nvim")
  vim.notify(bigfile, "error", { title = "bigfile" })
  return
end

bigfile.setup({
  filesize = 50, -- After this size (in MB), the file will be considered big
})
