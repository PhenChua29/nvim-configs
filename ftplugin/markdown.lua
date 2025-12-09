local options = {
  wrap = true,
  linebreak = true, -- Wrap at word boundary
  textwidth = 80,
}

for k, v in pairs(options) do
  vim.opt_local[k] = v
end

