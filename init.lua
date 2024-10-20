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
    "rebelot/kanagawa.nvim",
  },
  {
    "morhetz/gruvbox"
  },
  {
    'sainnhe/everforest'
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
    "nvhoang2803/pets.nvim",
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
  }
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }
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

-- Configuration for cmp-ai with Ollama
-- local cmp_ai = require('cmp_ai.config')
--
-- cmp_ai:setup({
--   max_lines = 100,
--   provider = 'Ollama', -- Set Ollama as the provider for completions
--   provider_options = {
--     model = 'llabma', -- Set the model being used
--     prompt = function(lines_before, lines_after)
--       return lines_before
--     end,
--     suffix = function(lines_after)
--       return lines_after
--     end,
--   },
--   notify = true, -- Notify when suggestions are available
--   notify_callback = function(msg)
--     vim.notify(msg) -- Use Neovim's notify system
--   end,
--   run_on_every_keystroke = true, -- Trigger completions on every keystroke
-- })

-- Setting up nvim-cmp with cmp-ai as a source
-- Import nvim-cmp
-- local cmp = require'cmp'
--
-- -- Set up nvim-cmp
-- cmp.setup({
--   -- Define the completion sources
--   sources = {
--     { name = 'nvim_lsp' },    -- LSP source
--     { name = 'buffer' },      -- Buffer source
--     { name = 'path' },        -- Path source
--     -- { name = 'cmp_ai'}
--   },
--
--   -- Key mappings (you can customize this part based on your preference)
--   mapping = {
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),  -- Confirm completion
--     ['<C-Space>'] = cmp.mapping.complete(),             -- Trigger completion manually
--   },
--
--   -- Additional settings for behavior (optional)
--   completion = {
--     completeopt = 'menu,menuone,noinsert'
--   },
--
--   -- Set up snippet support (if you're using LuaSnip or another snippet plugin)
--   snippet = {
--     expand = function(args)
--       vim.fn["vsnip#anonymous"](args.body)  -- For `vsnip` users
--       -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users
--     end,
--   },
-- })

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
