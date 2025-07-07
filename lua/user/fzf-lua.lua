local ok, fzfLua = pcall(require, "fzf-lua")

if not ok then
	print("Error while loading: fzf-lua", "error")
	notify(fzfLua, "error", { title = "fzf-lua" })
	return
end

fzfLua.setup({
	files = {
		hidden = true,
		fd_opts = "--type f "
			.. "--type l "
			.. "--hidden "
			.. "-E .git "
			.. "-E build "
			.. "-E nbproject "
			.. "-E node_modules "
			.. "-E .venv "
			.. "-E .next "
			.. "-E .history "
			.. "-E android",
	},
	grep = {
		rg_blob = true, -- enable glob parsing by default to all grep providers? (default:false)
		rg_opts = "--column "
			.. "--line-number "
			.. "--no-heading "
			.. "--color=always "
			.. "--smart-case "
			.. "--max-columns=4096 "
			.. "--glob '!.git/*' "
			.. "--glob '!build/*' "
			.. "--glob '!nbproject/*' "
			.. "--glob '!node_modules/*' "
			.. "--glob '!.venv/*' "
			.. "--glob '!.next/*' "
			.. "--glob '!.history/*' "
			.. "--glob '!android/*' "
			.. "-e",
	},
})

