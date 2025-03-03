local configs = {
 -- Enable basic formatting when a filetype is not found
 { "neoformat_basic_format_align", 1 },
 { "neoformat_basic_format_retab", 1 },
 { "neoformat_basic_format_trim", 1 },
 
 -- Load formatters from node_modules first
 { "neoformat_try_node_exe", 1 },

 -- Only msg when there is an error
 { "neoformat_only_msg_on_error", 1 }
}

for k, v in pairs(configs) do
  vim.g[k] = v 
end
