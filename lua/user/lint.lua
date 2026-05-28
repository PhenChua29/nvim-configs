local ok, lint = pcall(require, "lint")

if not ok then
	print("Error while loading: lint")
	vim.notify(lint, "error", { title = "lint" })
	return
end

-- Keymaps and commands
vim.api.nvim_create_user_command("Lint", function()
	lint.try_lint()
end, {})

vim.keymap.set("n", "<leader>;", lint.try_lint, { desc = "Run lint" })

-- Config
lint.linters_by_ft = {
	python = { "ruff" },
	javascript = { "prettier", "eslint" },
	go = { "golangcilint" },
	sh = { "shellcheck" },
}
