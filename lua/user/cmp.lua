local ok, cmp = pcall(require, "cmp")
if not ok then
  vim.notify("Error while loading: cmp")
  error(cmp)
end

local src = {
  { name = "buffer" },
} 

cmp.setup({
  sources = cmp.config.sources(src),

  mapping = {
    -- Accept selected item (if no item is selected, choose the first one)
    -- Set `select = false` to force manual selection
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),

    ["<C-y>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
  },
})
