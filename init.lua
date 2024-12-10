-- Set leader key and base46 cache path
vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

-- Initialize vim-plug (legacy plugin manager, likely not needed if using lazy.nvim)
vim.cmd([[
call plug#begin('~/.local/share/nvim/plugged')
" Add your plugins here if needed
" Plug 'author/pluginname'
call plug#end()
]])

-- Bootstrap lazy.nvim and load plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Lazy.nvim configuration
local lazy_config = require "configs.lazy"
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  { import = "plugins" },
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal", path = "~/Personal/obsidian-notes",
        },
      },
    },
  },
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
  },
  {
    "ellisonleao/gruvbox.nvim", priority = 1000 , config = true
  },
  {
    "voldikss/vim-floaterm",
    config = function()
      -- Optional configurations
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
      vim.g.floaterm_keymap_toggle = "<F12>"  -- Set the toggle keymap
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim"
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
    "David-Kunz/gen.nvim",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
    end,
  },
  {'tzachar/cmp-ai', dependencies = 'nvim-lua/plenary.nvim'},
  {
  -- Completion engine
  'hrsh7th/nvim-cmp',

  -- LSP source for nvim-cmp
  'hrsh7th/cmp-nvim-lsp',

  -- Buffer source for nvim-cmp
  'hrsh7th/cmp-buffer',

  -- Path source for nvim-cmp
  'hrsh7th/cmp-path', dependencies = {'tzachar/cmp-ai'}},
  {
    "epwalsh/pomo.nvim",
    version = "*",  -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    dependencies = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      "rcarriga/nvim-notify",
    },
    opts = {
      -- See below for full list of options 👇
    },
  },
  {
    "peter-nv/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    -- config = function()
    --   require("copilot").setup({})
    -- end,
    --
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { 'mistweaverco/kulala.nvim', opts = {} },
  { "folke/zen-mode.nvim", opts = {} },
  {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end,
  }
}, lazy_config)

-- Load theme and statusline
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load NvChad autocommands
require "nvchad.autocmds"

-- Configuration for keys.nvim

-- Configuration
require('configs.screenkey');
require('configs.obsidian');
require('configs.neovide');
require('configs.gitsigns');
require('configs.leetcode');
require('configs.notify');
require('configs.gen');
require('configs.lualine');
require('configs.pomo');
require('configs.pets');
require('configs.avante')
require('configs.noice');
require('configs.harpoon');
require('configs.rest');
require('configs.zen');

-- Enable relative number lines
vim.wo.relativenumber = true
vim.opt.conceallevel = 1
vim.opt.termguicolors = true
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
-- Load additional mappings
vim.schedule(function()
  require "mappings"
end)
