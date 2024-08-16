vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
-- Initialize vim-plug
vim.cmd([[
call plug#begin('~/.local/share/nvim/plugged')

" Add your plugins here
" Plug 'author/pluginname'
call plug#end()
]])

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
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
  end
  }
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

-- Pet configuration
require('hologram').setup({
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
})

require("pets").setup(
{
  row = 1, -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
  col = 10, -- the column to display the pet at (set to high number to have it stay still on the right side)
  speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
  default_pet = "dog", -- the pet to use for the PetNew command
  default_style = "brown", -- the style of the pet to use for the PetNew command
  random = true, -- whether to use a random pet for the PetNew command, overrides default_pet and default_style
  death_animation = true, -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
  popup = { -- popup options, try changing these if you see a rectangle around the pets
    width = "30%", -- can be a string with percentage like "45%" or a number of columns like 45
    winblend = 100, -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
    hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
    avoid_statusline = false, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
    -- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
  }
}
)

-- Configuration for gitsigns
require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
}
--

-- Configuration for NEOVIDE
vim.g.neovide_transparency = 0.7
-- 

vim.schedule(function()
  require "mappings"
end)
