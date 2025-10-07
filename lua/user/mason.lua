local ok, mason = pcall(require, "mason")

if not ok then
	print("Error while loading: mason")
	notify(mason, "error", { title = "mason" })
	return
end

mason.setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

local ok, masonInstaller = pcall(require, "mason-tool-installer")

if not ok then
	print("Error while loading: mason-tool-installer")
	notify(masonInstaller, "error", { title = "mason-tool-installer" })
	return
end

masonInstaller.setup({
	ensure_installed = {
		"stylua",
		"prettier",
		"clang-format",
		"shfmt",

		-- lsp
		"typescript-language-server",
		"css-lsp", -- CSS, SCSS, LESS
		"jdtls", -- Java
		"tailwindcss-language-server",
		"kotlin-language-server",
		"ansible-language-server",
		"eslint-lsp",
		"basedpyright", -- Python
	},
})

local ok, masonLsp = pcall(require, "mason-lspconfig")

if not ok then
	print("Error while loading: mason-lspconfig")
	notify(masonLsp, "error", { title = "mason-lspconfig" })
	return
end

local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
	print("Error while loading: lspconfig")
	vim.notify(lspconfig, "error", { title = "lspconfig" })
	return
end

masonLsp.setup()
