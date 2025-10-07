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
local ignore = { lint = { unknownAtRules = "ignore" } }

vim.lsp.config("cssls", {
  -- Ignore the annoying unknownAtRules error in css files
	settings = {
		css = ignore,
		scss = ignore,
		less = ignore,
	},
})

-- Ansible file detection
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.yml", "*.yaml" },
	callback = function()
		local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)

		if first_line[1] ~= nil and first_line[1] == "---" then
			vim.bo[0].filetype = "yaml.ansible"
		end
	end,
	desc = "Automatically detect ansible files",
})
