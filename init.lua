-- ──────────────🌟 Core Settings ──────────────
vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.wo.relativenumber = true
vim.opt.conceallevel = 1
vim.opt.termguicolors = true

-- ──────────────🚀 Lazy.nvim Bootstrap ──────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- ──────────────🔧 Lazy.nvim Config ──────────────
local lazy_config = require("configs.lazy")

require("lazy").setup({
  -- ✨ Core Framework
  {
    "NvChad/NvChad",
    lazy = true,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require("options")
    end,
  },

  -- 📦 Plugin Imports
  { import = "plugins" },

  -- 🧩 UI Plugins
  { "lukas-reineke/indent-blankline.nvim" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function() end },
  { "typicode/bg.nvim", lazy = false },

  -- 🌈 Themes and Visuals
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          {
            section = "terminal",
            cmd = "chafa ~/.config/nvim/assets/cat.jpg --format symbols --symbols block --size 60x60",
            height = 30,
          },
          {
            pane = 2,
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        },
      },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  -- 📑 Markdown / Writing Tools
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        { name = "personal", path = "~/Personal/obsidian-notes" },
      },
    },
  },

  -- 🧠 Productivity Tools
  {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    dependencies = { "rcarriga/nvim-notify" },
    opts = {},
  },
  { "folke/zen-mode.nvim", opts = {} },
  { "David-Kunz/gen.nvim" },
  { "goolord/alpha-nvim", config = function() require("alpha").setup(require("alpha.themes.dashboard").config) end },
  { "mistweaverco/kulala.nvim", opts = {} },

  -- 🔌 Terminal & Floating Tools
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
      vim.g.floaterm_keymap_toggle = "<F12>"
    end,
  },

  -- 🛠️ Developer Utilities
  {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  },
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "peter-nv/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- 🚀 Completion & AI
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "tzachar/cmp-ai",
    },
  },
  { "tzachar/cmp-ai", dependencies = "nvim-lua/plenary.nvim" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require("copilot").setup({}) end,
  },

  -- 📌 Bookmarking & Navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}, lazy_config)

-- ──────────────🎨 Load Theme & UI ──────────────
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- ──────────────🛠 Load Plugin Configs ──────────────
require("configs.screenkey")
require("configs.obsidian")
require("configs.neovide")
require("configs.gitsigns")
require("configs.leetcode")
require("configs.notify")
require("configs.gen")
require("configs.lualine")
require("configs.pomo")
require("configs.pets")
require("configs.noice")
require("configs.harpoon")
require("configs.rest")
require("configs.zen")
require("configs.copilot")

-- ──────────────🎹 Load Key Mappings ──────────────
vim.schedule(function()
  require("mappings")
end)
