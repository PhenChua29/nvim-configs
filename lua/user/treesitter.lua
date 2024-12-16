local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
  print("Error while loading: Treesitter")
  vim.notify(treesitter, "error", { title = "Treesitter" })
  return
end

treesitter.setup({
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "html" },

  -- Automatically install missing parsers when entering buffer
  -- NOTE: require treesitter-cli installed
  auto_install = true,
})
