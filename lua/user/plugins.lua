-- Nice list of popular plugins: https://github.com/rockerBOO/awesome-neovim
----------------------------------------------------------------------------

-- Local path for lazy.nvim installation
local installPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Construct the cmd to pull the info
local repo = "https://github.com/folke/lazy.nvim.git"
local cmd = {
  "git",
  "clone",
  "--filter=blob:none", -- Only pull the commit history and file structure, no content
  repo,
  "--branch=stable", -- get the lastest realease with "stable" tag
  installPath
}

-- Check if the directory is present. If not, clone the repo
if not (vim.uv or vim.loop).fs_stat(installPath) then
  vim.fn.system(cmd)
  vim.notify("Lazy.nvim directory not detected, installing...")
end

vim.opt.rtp:prepend(installPath)

-- Setting up lazy.nvim
local ok, lazy = pcall(require, "lazy")
if not ok then
  vim.notify("Error while loading: Lazy.nvim")
  error(lazy)
end

-- Table of plugins
local plugins = {

  -- Themes
  "daschw/leaf.nvim",
  "loctvl842/monokai-pro.nvim",
  "olimorris/onedarkpro.nvim",

  -- Code completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
}

-- Some custom icons for Lazy.nvim interfaces
local opts = {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "",
      ft = "",
      init = "󱓞",
      keys = "󰌆",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "󱓞",
      task = "󰐃",
      lazy = "󰒲",
    },
  },
}

lazy.setup(plugins, opts) 
