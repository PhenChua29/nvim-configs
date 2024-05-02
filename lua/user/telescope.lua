local ok, telescope = pcall(require, "telescope")

if not ok then
  vim.notify("Error while loading: telescope")
  error(telescope)
end

telescope.setup()
