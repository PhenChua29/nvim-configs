local ok, comment = pcall(require, "Comment")

if not ok then
  print("Error while loading: comment")
  vim.notify(comment, "error", { title = "Comment" })
  return
end

-- comment.setup({
  -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
-- })

local ok, ts_context = pcall(require, "ts_context_commentstring")

if not ok then
  print("Error while loading: ts_context_commentstring")
  vim.notify(ts_context, "error", { title = "ts_context_commentstring" })
  return
end

ts_context.setup {
  enable_autocmd = false,
}

local get_option = vim.filetype.get_option

vim.filetype.get_option = function(filetype, option)
  return option == "commentstring"
    and require("ts_context_commentstring.internal").calculate_commentstring()
    or get_option(filetype, option)
end
