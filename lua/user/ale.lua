local ok, ale = pcall(require, "ale")

if not ok then
	print("Error while loading: ale")
	vim.notify(ale, "error", { title = "ale" })
	return
end

ale.setup({
	fixers = {
		python = { "ruff" },
		javascript = { "prettier", "eslint" },
    go = { "golangci-lint" },
    yaml = { "yamlfmt" }
	},
})
