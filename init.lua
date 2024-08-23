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
  {
    "giusgad/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
  },
  { import = "plugins" },
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
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
  }
}, lazy_config)

-- Load theme and statusline
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load NvChad autocommands
require "nvchad.autocmds"

-- Pet configuration
-- require("pets").setup({
--   row = 1,
--   col = 10,
--   speed_multiplier = 1,
--   default_pet = "dog",
--   default_style = "brown",
--   random = true,
--   death_animation = true,
--   popup = {
--     width = "30%",
--     winblend = 100,
--     hl = { Normal = "Normal" },
--     avoid_statusline = false,
--   }
-- })
-- Configuration for keys.nvim
require("screenkey").setup({
    win_opts = {
        row = vim.o.lines - vim.o.cmdheight - 1,
        col = vim.o.columns - 1,
        relative = "editor",
        anchor = "SE",
        width = 40,
        height = 3,
        border = "single",
        title = "Screenkey",
        title_pos = "center",
        style = "minimal",
        focusable = false,
        noautocmd = true,
    },
    compress_after = 3,
    clear_after = 3,
    disable = {
        filetypes = {},
        buftypes = {},
        events = false,
    },
    show_leader = true,
    group_mappings = false,
    display_infront = {},
    display_behind = {},
    filter = function(keys)
        return keys
    end,
    keys = {
        ["<TAB>"] = "󰌒",
        ["<CR>"] = "󰌑",
        ["<ESC>"] = "Esc",
        ["<SPACE>"] = "␣",
        ["<BS>"] = "󰌥",
        ["<DEL>"] = "Del",
        ["<LEFT>"] = "",
        ["<RIGHT>"] = "",
        ["<UP>"] = "",
        ["<DOWN>"] = "",
        ["<HOME>"] = "Home",
        ["<END>"] = "End",
        ["<PAGEUP>"] = "PgUp",
        ["<PAGEDOWN>"] = "PgDn",
        ["<INSERT>"] = "Ins",
        ["<F1>"] = "󱊫",
        ["<F2>"] = "󱊬",
        ["<F3>"] = "󱊭",
        ["<F4>"] = "󱊮",
        ["<F5>"] = "󱊯",
        ["<F6>"] = "󱊰",
        ["<F7>"] = "󱊱",
        ["<F8>"] = "󱊲",
        ["<F9>"] = "󱊳",
        ["<F10>"] = "󱊴",
        ["<F11>"] = "󱊵",
        ["<F12>"] = "󱊶",
        ["CTRL"] = "Ctrl",
        ["ALT"] = "Alt",
        ["SUPER"] = "󰘳",
        ["<leader>"] = "<leader>",
    },
})
-- Configuration for hologram (pet image display)
-- require('hologram').setup({ auto_display = true, -- Enable automatic markdown image display
--   display_opts = {
--     width = 30, -- Width of the display window
--     height = 20, -- Height of the display window
--   },
--   -- Additional options
-- })
-- Configuration for gitsigns
require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
  },
}

-- Configuration for Obsidian.nvim
require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Personal/obsidian-notes",
      strict = true,
    },
  },
  daily_notes = {
    folder = "Daily Notes",
    date_format = "%Y-%m-%d",
    template = "Personal/Templates/Daily Note Template.md",
  },
  templates = {
    folder = "Personal/Templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
  open_app_foreground = false,
})



-- Neovide configuration
vim.g.neovide_transparency = 0.8
-- vim.g.neovide_profiler = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 1.0
vim.g.neovide_hide_mouse_when_typing = false
vim.opt.conceallevel = 1

-- Keybinding configurations
vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true, silent = true })

-- Enable relative number lines
vim.wo.relativenumber = true

-- Load additional mappings
vim.schedule(function()
  require "mappings"
end)
