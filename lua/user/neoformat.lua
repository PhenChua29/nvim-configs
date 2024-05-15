local configs = {
  -- Enable basic formatting when a filetype is not found
 { "neoformat_basic_format_align", 1 },
 { "neoformat_basic_format_retab", 1 },
 { "neoformat_basic_format_trim", 1 },
}

for k, v in pairs(configs) do
  vim.g[k] = v 
end
