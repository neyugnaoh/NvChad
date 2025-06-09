-- Set leader key and base46 cache path
vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

-- Initialize vim-plug (legacy plugin manager, likely not needed if using lazy.nvim)

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
       lazy = true,
       branch = "v2.5",
       import = "nvchad.plugins", config = function()
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
  },
  { "typicode/bg.nvim", lazy = false },
{
  "sainnhe/gruvbox-material",
  priority = 1000, -- Ensure it loads before anything else
  config = function()
    vim.g.gruvbox_material_background = "hard" -- Options: 'soft', 'medium', 'hard'
    vim.g.gruvbox_material_enable_italic = 1
    vim.cmd("colorscheme gruvbox-material")
  end
},
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
        enabled = true,
        sections = {
          {
            section = "terminal",
            cmd = "chafa ~/.config/nvim/cat.jpg --format symbols --symbols block --size 60x60",
            height = 30,
            -- padding = 1,
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
    scroll = { enabled = false},
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
},
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      -- for example
      provider = "openai",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o-mini", -- your desired model (or use gpt-4o, etc.)
        timeout = 30000, -- timeout in milliseconds
        temperature = 0, -- adjust if needed
        max_tokens = 4096,
        -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
      {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
      },
    },
  }
}, lazy_config)

-- Load theme and statusline dofile(vim.g.base46_cache .. "defaults")
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
require('configs.snacks');

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
