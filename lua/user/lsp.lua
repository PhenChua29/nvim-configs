-- Import lspconfig and cmp_nvim_lsp
local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
  print("Error while loading: lspconfig")
  vim.notify(lspconfig, "error", { title = "lspconfig" })
  return
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not ok then
  print("Error while loading: cmp_nvim_lsp")
  vim.notify(cmp_nvim_lsp, "warn", { title = "cmp_nvim_lsp" })
end

-- Setup lsp support for cmp
-- local config = { capabilities = cmp_nvim_lsp.default_capabilities() }

-- init TypeScript/JS lsp
lspconfig.tsserver.setup({})
