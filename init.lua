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
          name = "personal",
          path = "~/Personal/obsidian-notes",
        },
      },
    },
  },
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*", -- or branch = "dev", to use the latest commit
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "lukas-reineke/indent-blankline.nvim"
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


vim.opt.conceallevel = 1

-- Enable relative number lines
vim.wo.relativenumber = true

-- Load additional mappings
vim.schedule(function()
  require "mappings"
end)
