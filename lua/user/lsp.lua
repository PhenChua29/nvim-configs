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

-- Change hover border
local border = {
      {"┏", "FloatBorder"},
      {"━", "FloatBorder"},
      {"┓", "FloatBorder"},
      {"┃", "FloatBorder"},
      {"┛", "FloatBorder"},
      {"━", "FloatBorder"},
      {"┗", "FloatBorder"},
      {"┃", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


-- Setup lsp support for cmp
-- local config = { capabilities = cmp_nvim_lsp.default_capabilities() }

-- init TypeScript/JS lsp
lspconfig.ts_ls.setup({})

-- init HTML/CSS/JSON/ESLINT
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup({ capabilities = capabilities })

-- init Ansible language server
-- lspconfig.ansiblels.setup({
  -- filetypes = { "yaml" }
-- })

-- init TailwindCSS server
lspconfig.tailwindcss.setup{}

-- Java
lspconfig.java_language_server.setup{}

-- Kotlin
lspconfig.kotlin_language_server.setup{}
