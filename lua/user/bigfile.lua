local ok, bigfile = pcall(require, "bigfile")

if not ok then
  vim.notify("Error while loading: bigfile.nvim")
  error(bigfile)
end

bigfile.setup({
  filesize = 50, -- After this size (in MB), the file will be considered big
})