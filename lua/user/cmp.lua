local ok, cmp = pcall(require, "cmp")
if not ok then
  vim.notify("Error while loading: cmp")
  error(cmp)
end

local src = {
  { -- Search for words in buffer (can be a resource hog with large file) 
    name = "buffer",
    option = {
      keyword_length = 1, -- Perform completion after typing n character

      get_bufnrs = function() -- Stop buffer completion if the file is too big
        local max_size = 50 -- MB

        local api = vim.api
        local bufs = api.nvim_get_current_buf()
        local size = api.nvim_buf_get_offset(0,
        api.nvim_buf_line_count(0))

        if (size / 1024 / 1024 > max_size) then
          return {}
        else
          return {bufs}
        end
      end
    }
  },
  { -- Search for filesystem paths
    name = "path"
  },
  {
    name = "dotenv",
    option = {
      load_shell = false,
      dotenv_environment = '.*',
    }
  },
  { -- Search for Lua functions
    name = "nvim_lua"
  },
  { -- lsp
    name = "nvim_lsp"
  },
}

function getBorder(joins, horizontal, vertical)
  return { joins, horizontal, joins, vertical, joins, horizontal, joins, vertical }
end

function getBorderMultipleJoins(joins, horizontal, vertical)
  return { joins[1], horizontal, joins[2], vertical, joins[3], horizontal, joins[4], vertical }
end


local borders = {
  "single",
  "double",
  "rounded",
  getBorder("+", "-", "|"),
  getBorderMultipleJoins({ "┏", "┓", "┛", "┗" }, "━", "┃"), -- single bold
}

local window_style = {
  border = borders[3], 
}

cmp.setup({
  sources = cmp.config.sources(src),

  mapping = {
    -- Accept selected item (if no item is selected, choose the first one)
    -- Set `select = false` to force manual selection
    ["<CR>"] = cmp.mapping.confirm({select = true}),

    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),

    ["<C-y>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close()
  },

  experimental = {
    ghost_text = true, -- Turn off this feature if copilot.vim's preview is used.
  },
  
  window = {
    completion = window_style,
    documentation = window_style,
  },
})
