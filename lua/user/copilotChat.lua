local ok, copilotChat = pcall(require, "CopilotChat")

if not ok then
  print("Error while loading: CopilotChat")
  vim.notify(copilotChat, "error", { title = "CopilotChat" })
  return
end

copilotChat.setup()

