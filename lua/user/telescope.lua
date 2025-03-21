local ok, telescope = pcall(require, "telescope")

if not ok then
	print("Error while loading: telescope.nvim")
	vim.notify(telescope, "error", { title = "telescope" })
	return
end

telescope.setup({
	defaults = {
		-- Custom texts
		prompt_prefix = "🔍",
		results_title = "🍀",

		path_display = { "filename_first" }, -- Show files' names first, then paths later
		dynamic_preview_title = true, -- Show file name dynamically on preview window's title

		layout_strategy = "horizontal",
		sorting_strategy = "ascending", -- Reverse the results

		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.5,
			},
			center = {
				preview_cutoff = 1,
			},
		},
	},
	pickers = {
		find_files = {
			file_ignore_patterns = { "node_modules", ".git", ".venv", ".next" },
			hidden = true,
			no_ignore = true,
		},
	},
})

-- =========== Popup window appearance ===========
local api = vim.api

api.nvim_set_hl(0, "TelescopeNormal", {})
api.nvim_set_hl(0, "TelescopeBorder", {})
