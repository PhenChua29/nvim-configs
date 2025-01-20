local ok, tailwind = pcall(require, "tailwind-tools")

if not ok then
  print("Error while loading: tailwind-tools")
  vim.notify(tailwind, "error", { title = "tailwind-tools" })
  return
end

tailwind.setup()
