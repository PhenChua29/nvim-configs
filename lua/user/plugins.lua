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
  print("Lazy.nvim directory not detected, installing...")
end

vim.opt.rtp:prepend(installPath)

-- Setting up lazy.nvim
local ok, lazy = pcall(require, "lazy")
if not ok then
  print("Error while loading: Lazy.nvim")
  error(lazy)
end

-- Table of plugins
local plugins = {

  -- Themes
  { "daschw/leaf.nvim", lazy = true },
  { "loctvl842/monokai-pro.nvim", lazy = true },
  { "olimorris/onedarkpro.nvim", lazy = true },

  -- Code completion
  { 
    "hrsh7th/nvim-cmp", 
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "SergioRibera/cmp-dotenv",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",    
      "luckasRanarison/tailwind-tools.nvim"
    },
  },
   
  -- Big file handler
  { "LunarVim/bigfile.nvim", lazy = true },
  
  -- lsp
  { "neovim/nvim-lspconfig", lazy = true }, 
  
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim", -- improve sorting performance
    } 
  },

  -- Which key
  { "folke/which-key.nvim", lazy = true },

  -- Git integration
  { "lewis6991/gitsigns.nvim", lazy = true },
  {
    "kdheepak/lazygit.nvim",
      event = "VeryLazy",

      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
  },

  -- Terminal
   { "akinsho/toggleterm.nvim", lazy = true },

  -- Notification
  { "rcarriga/nvim-notify" },
  { "folke/trouble.nvim", event = "BufReadPre" },

  -- Editing
  { "windwp/nvim-autopairs", event = "InsertEnter" },
  { "kylechui/nvim-surround", lazy = true },
  { "windwp/nvim-ts-autotag", event = "InsertEnter" },
  { "numToStr/Comment.nvim", event = "BufEnter" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufEnter" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", event = "BufEnter" },

  -- Highlighter
  { "catgoose/nvim-colorizer.lua", event = "BufReadPre" },

  -- Formatter
  { "sbdchd/neoformat", event = "InsertEnter" },

  -- Snippet engine
  { 
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { 
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    build = "make install_jsregexp",
  },
  
  -- Obsidian
  {
    "epwalsh/obsidian.nvim",
    version="*",
    lazy = true,
    ft = "markdown",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- Buffer line
  { 
    "akinsho/bufferline.nvim", 
    event = "BufEnter",
    dependencies = "nvim-tree/nvim-web-devicons"
  },

  -- File explorer
  {
    "stevearc/oil.nvim"
  },

  -- TailwindCSS
  {
    "luckasRanarison/tailwind-tools.nvim",
    event = "BufEnter",
    dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "neovim/nvim-lspconfig",
    } 
  },

  -- Indent line
  { "lukas-reineke/indent-blankline.nvim", event = "BufEnter" },

  -- AI
  { "github/copilot.vim", event = "BufEnter" },

  -- Sessions manager 
  { "rmagatti/auto-session", lazy = false }
}

-- Some custom icons for Lazy.nvim interfaces
local opts = {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "󰃭",
      ft = "",
      init = "🚀",
      keys = "󰌆",
      plugin = "",
      runtime = "",
      require = "🎯",
      source = "󰞗",
      start = "🚀",
      task = "󰐃",
      lazy = "💤",
    },
  },
}

lazy.setup(plugins, opts) 
