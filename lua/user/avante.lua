local ok, avante = pcall(require, "avante")

if not ok then
	print("Error while loading: avante")
	vim.notify(avante, "error", { title = "Avante" })
	return
end

avante.setup({
	provider = "copilot",
})
