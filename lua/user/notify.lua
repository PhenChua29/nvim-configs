local ok, notify = pcall(require, "notify")

if not ok then
  print("Error while loading: notify", "error")
  vim.notify(notify, "error", { title = "notify" })
  return
end

notify.setup({
  background_colour = "#000000",
})

_G.notify = notify

local banned_messages = { "No information available" }
vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if msg == banned then
      return
    end
  end
  return notify(msg, ...)
end
