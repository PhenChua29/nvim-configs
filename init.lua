-- My default theme just in case
vim.cmd("colorscheme lunaperche")

-- Importing stuff down there

local imports = {
	"keymaps",
	"options",
	"plugins",
	"notify",
	"theme",
	"cmp",
	"bigfile",
	"lsp",
	"mason",
  -- "java",
	"telescope",
  "fzf-lua",
	-- "whichkey",
	"gitsigns",
	"toggleterm",
	"autopairs",
	"autotag",
	"comment",
	"treesitter",
	"colorizer",
	"surround",
	-- "neoformat",
	"formatter",
	"luasnip",
	"obsidian",
  "render-markdown",
	"lualine",
	"bufferline",
	"indent-blankline",
	"oil",
	-- "copilot",
  -- "copilotChat",
  -- "avante",
	"neovide",
	"auto-session",
	"trouble",
}

for _, v in pairs(imports) do
	local ok, err = pcall(require, "user." .. v)

	if not ok then
		vim.notify("Something's wrong while loading: \"" .. v .. '"\n\n')
		vim.notify(err)
	end
end
