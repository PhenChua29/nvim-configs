local ok, obsidian = pcall(require, "obsidian")

if not ok then
	print("Error while loading: obsidian")
	vim.notify(obsidian, "error", { title = "obsidian" })
	return
end

local workspaces = {
	{
		name = "University",
		path = "~/fpt/notes",
	},
}

local attachments = {
	img_folder = "Files",
}

local daily_notes = {
	folder = "Journey/Daily",
}

local templates = {
	folder = "Template",
}

obsidian.setup({
	workspaces = workspaces,
	attachments = attachments,
	daily_notes = daily_notes,
	new_notes_location = "Inbox",

	-- Prefix imgs with timestamp for uniqueness
	image_name_func = function()
		-- Prefix image names with timestamp.
		return string.format("%s-", os.time())
	end,

	templates = templates,

	ui = { enable = false },
})
