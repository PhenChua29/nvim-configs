if not vim.g.neovide then
  return
end

local options = {
  -- =========== APPEARANCE =========== 
  neovide_normal_opacity = 0.85,
  neovide_cursor_trail_size = 0.1
}

-- Enabling the configs
for k, v in pairs(options) do
  vim.g[k] = v
end

vim.notify("Loaded neovide configs.")
