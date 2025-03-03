local ok, autoSession = pcall(require, "auto-session")

if not ok then
  print("Error while loading: auto-session")
  vim.notify(autoSession, "error", { title = "auto-session" })
  return
end

autoSession.setup({
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
})
