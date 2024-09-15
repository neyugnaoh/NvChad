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
-- require('hologram').setup({ 
-- auto_display = true, -- Enable automatic markdown image display
-- display_opts = {
--   width = 15, -- Width of the display window
--   height = 10, -- Height of the display window
-- },
-- Additional options
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
require('configs.obsidian');

-- Neovide configuration
vim.g.neovide_transparency = 0.6
-- vim.g.neovide_profiler = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 1.0
vim.g.neovide_hide_mouse_when_typing = true
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
-- Use Cmd + V to paste from clipboard in normal mode
vim.api.nvim_set_keymap('n', '<D-v>', '"+p', { noremap = true, silent = true })

-- Use Cmd + V to paste in insert mode
vim.api.nvim_set_keymap('i', '<D-v>', '<C-r>+', { noremap = true, silent = true })

-- Enable relative number lines
vim.wo.relativenumber = true

-- require('image').setup {
--   backend = "kitty",
--   -- backend = "ueberzug",
--   integrations = {
--     -- Notice these are the settings for markdown files
--     markdown = {
--       enabled = true,
--       clear_in_insert_mode = true,
--       download_remote_images = true,
--       only_render_image_at_cursor = true,
--       filetypes = { "markdown", "vimwiki" },
--     },
--     neorg = {
--       enabled = true,
--       clear_in_insert_mode = false,
--       download_remote_images = true,
--       only_render_image_at_cursor = true,
--       filetypes = { "norg" },
--     },
--     -- This is disabled by default
--     -- Detect and render images referenced in HTML files
--     -- Make sure you have an html treesitter parser installed
--     -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua
--     html = {
--       enabled = true,
--     },
--     -- This is disabled by default
--     -- Detect and render images referenced in CSS files
--     -- Make sure you have a css treesitter parser installed
--     -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua
--     css = {
--       enabled = true,
--     },
--   },
--   max_width = nil,
--   max_height = nil,
--   max_width_window_percentage = 40,
--
--   -- This is what I changed to make my images look smaller, like a
--   -- thumbnail, the default value is 50
--   max_height_window_percentage = 20,
--   -- max_height_window_percentage = 40,
--
--   -- toggles images when windows are overlapped
--   window_overlap_clear_enabled = false,
--   window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
--
--   -- auto show/hide images when the editor gains/looses focus
--   editor_only_render_when_focused = true,
--
--   -- auto show/hide images in the correct tmux window
--   -- In the tmux.conf add `set -g visual-activity off`
--   tmux_show_only_in_active_window = true,
--
--   -- render image files as images when opened
--   hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
-- }
-- Load additional mappings
vim.schedule(function()
  require "mappings"
end)
