local ok, mason = pcall(require, "mason")

if not ok then
	print("Error while loading: mason")
	notify(mason, "error", { title = "mason" })
	return
end

mason.setup()

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
		"shfmt"
	}
})
