if not vim.g.neovide then
	return
end

local options = {
	-- =========== APPEARANCE ===========
	neovide_normal_opacity = 0.85,
	neovide_cursor_trail_size = 0.1,
}

-- Enabling the configs
for k, v in pairs(options) do
	vim.g[k] = v
end

-- =========== KEYMAPS ===========

-- Fix ctrl shift v not working
vim.keymap.set({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<C-S-v>", function()
	vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, { noremap = true, silent = true })
