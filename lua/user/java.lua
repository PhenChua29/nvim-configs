-- local ok, java = pcall(require, "java")

-- if not ok then
	-- vim.notify(java, "error", { title = "java" })
	-- return
-- end

local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
	vim.notify(lspconfig, "error", { title = "java" })
	return
end

-- java.setup()
lspconfig.jdtls.setup()
