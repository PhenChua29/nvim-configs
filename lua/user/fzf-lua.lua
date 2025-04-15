local ok, fzfLua = pcall(require, "fzf-lua")

if not ok then
	print("Error while loading: fzf-lua", "error")
	notify(fzfLua, "error", { title = "fzf-lua" })
	return
end

fzfLua.setup({
	files = {
    hidden = true
  },
	grep = {
		rg_blob = true, -- enable glob parsing by default to all grep providers? (default:false)
	}
})
