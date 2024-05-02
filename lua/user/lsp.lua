-- Import lspconfig and cmp_nvim_lsp
local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
  vim.notify("Error while loading: lspconfig")
  error(lspconfig)
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not ok then
  vim.notify("Error while loading: cmp_nvim_lsp")
  error(cmp_nvim_lsp)
end

-- Setup lsp support for cmp
-- local config = { capabilities = cmp_nvim_lsp.default_capabilities() }

-- init TypeScript/JS lsp
lspconfig.tsserver.setup({})
