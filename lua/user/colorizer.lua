local ok, colorizer = pcall(require, "colorizer")

if not ok then
  print("Error while loading: colorizer")
  vim.notify(colorizer, "error", { title = "colorizer" })
  return
end

colorizer.setup({
   user_default_options = {
     css = true,
     tailwind = "both",
     sass = { enable = true, parsers = { "css" } },
     always_update = true, 
   }
})
