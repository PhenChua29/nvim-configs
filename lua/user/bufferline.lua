local ok, bufferline = pcall(require, "bufferline")

if not ok then
  print("Error while loading: bufferline")
  vim.notify(bufferline, "error", { title = "bufferline" })
  return
end

bufferline.setup{}
