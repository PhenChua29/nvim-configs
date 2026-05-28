local ok, formatter = pcall(require, "formatter")

if not ok then
	print("Error while loading: formatter", "error")
	notify(formatter, "error", { title = "formatter" })
	return
end

formatter.setup({
	filetype = {
		lua = require("formatter.filetypes.lua").stylua,
		html = require("formatter.filetypes.html").prettier,
		css = require("formatter.filetypes.css").prettier,
		javascript = require("formatter.filetypes.javascript").prettier,
		javascriptreact = require("formatter.filetypes.javascriptreact").prettier,
		typescript = require("formatter.filetypes.typescript").prettier,
		typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
		json = require("formatter.filetypes.json").prettier,
		markdown = require("formatter.filetypes.markdown").prettier,
		cs = require("formatter.filetypes.cs").dotnetformat,
		c = require("formatter.filetypes.c").clangformat,
		cpp = require("formatter.filetypes.cpp").clangformat,
		java = require("formatter.filetypes.java").clangformat,
		sh = require("formatter.filetypes.sh").shfmt,
    terraform = require("formatter.filetypes.terraform").terraformfmt,
    python = {
      require("formatter.filetypes.python").iruff,
      require("formatter.filetypes.python").ruff,
    },
    yaml = require("formatter.filetypes.yaml").prettier,
    toml = require("formatter.filetypes.toml").taplo,
    rust = require("formatter.filetypes.rust").rustfmt,
	},
})

-- notify("Loaded formatter" ,"info", { title = "formatter" })
