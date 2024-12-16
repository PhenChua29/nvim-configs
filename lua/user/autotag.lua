local ok, autotag = pcall(require, "nvim-ts-autotag")

if not ok then
  print("Error while loading: nvim-autotag")
  vim.notify(autotag, "error", { title = "nvim-autotag" })
  return
end

autotag.setup({
  opts = {
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = true -- Auto close on trailing </
  }
})
