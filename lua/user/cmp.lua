local ok, cmp = pcall(require, "cmp")

if not ok then
  print("Error while loading: cmp")
  vim.notify(cmp, "error", { title = "cmp" })
  return
end

local compare = cmp.config.compare
local ok_luasnip, luasnip = pcall(require, "luasnip")

if not ok_luasnip then
  print("Error while loading: luasnip")
  vim.notify(luasnip, "error", { title = "cmp" })
end

local DEBUG = false 

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
  { -- luasnip
    name = "luasnip",
  }
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

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

-- Setup the values
cmp.setup({
  sources = cmp.config.sources(src),

  mapping = {
    -- Accept selected item (if no item is selected, choose the first one)
    -- Set `select = false` to force manual selection
    ["<CR>"] = cmp.mapping.confirm({select = true}),

    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),

    ["<C-y>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
  },

  experimental = {
    ghost_text = true, -- Turn off this feature if copilot.vim's preview is used.
  },
  
  window = {
    completion = {
      border = borders[3], 
      winhighlight = 'Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None',
      scrollbar = false,
    },

    documentation = {
      border = borders[3], 
      winhighlight = 'Normal:None,FloatBorder:None',
    }
  },

  formatting = {
    
    -- Change item positions
    fields = { "kind" , "abbr", "menu" },
    format = function(entry, item)

      -- Vanila format with no dependency
      local vanila = function(entry, item, show_source)
        if DEBUG then
          print(string.format("item: %s", vim.inspect(item)))
        end
         
        -- icons
        local icon_name = item.kind
        item.menu = item.kind 
        item.kind = string.format("%s", kind_icons[icon_name])

        -- sources' name
        local custom_names = {
          buffer = "[Buffer]",
          path = "[Path]",
          dotenv = "[Env]",
          nvim_lua = "[Nvim lua]",
          nvim_lsp = "[LSP]",
        } 
        
        if show_source then
          item.menu = string.format("   %-12s%s", item.menu, custom_names[entry.source.name])
        else 
          item.menu = string.format("   %s", item.menu)
        end

        if DEBUG then
          print(string.format("item (modified): %s", vim.inspect(item)))
        end

        return item
      end

      -- Format with dependency
      local split_kind = function(entry, item)
        local ok, lspkind = pcall(require, "lspkind")
        
        if not ok then
          print("Error while loading: lspkind")
          vim.notify(lspkind, "error", { title = "cmp" })

          return vanila(entry, item) 
        end

        local modified_item = lspkind.cmp_format({ mode = "symbol_text" })(entry, item)
        local strings = vim.split(item.kind, "%s", { trimempty = true })
        modified_item.kind = " " .. (strings[1] or "") .. " "
        modified_item.menu = "    (" .. (strings[2] or "") .. ")"

        if DEBUG then
          local msg = ""
          msg = msg .. string.format("item: %s", vim.inspect(item)) 
          msg = msg .. string.format(", item.kind: \"%s\"", item.kind)
          msg = msg .. string.format(", strings[] (split from item.kind): %s", vim.inspect(strings))
          msg = msg .. string.format(", modified_item: %s", vim.inspect(modified_item)) 
          msg = msg .. string.format(", modified_item.kind: %s", modified_item.kind) 
          print(msg)
        end 

        return item 
      end

      if DEBUG then 
        local msg = ""
        msg = msg .. string.format("\nentry: %s", entry)
        msg = msg .. string.format("\n, original item: %s", vim.inspect(item))
        print(msg)
      end

      return vanila(entry, item, true) 
    end

  },

  sorting = {
    comparators = {
      function(entry1, entry2)
        local s1, s2 = entry1.source.name, entry2.source.name

        -- Prioritize LSP over others, but only if they differ
        if s1 == "nvim_lsp" and s2 ~= "nvim_lsp" then
          return true
        elseif s2 == "nvim_lsp" and s1 ~= "nvim_lsp" then
          return false
        end

        return nil
      end,
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.locality,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    }
  },

  snippet = {
    expand = function(args)
      if not ok_luasnip then
        vim.snippet.expand(args.body)
        return
      end

      luasnip.lsp_expand(args.body)
    end,
  }
})


