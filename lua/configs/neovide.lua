if vim.g.neovide then
  -- Neovide configuration
  vim.g.neovide_transparency = 0.9  -- Set transparency level (0-1)
  -- vim.g.transparency = 0.8
  vim.g.neovide_text_gamma = 0.0  -- Adjust text gamma
  vim.g.neovide_text_contrast = 1.0  -- Adjust text contrast
  vim.g.neovide_hide_mouse_when_typing = true  -- Hide mouse when typing

  -- Enable true color
  vim.opt.termguicolors = true

  -- Set colorscheme (Gruvbox in this case)
  -- vim.cmd("colorscheme gruvbox")
  -- vim.cmd("colorscheme kanagawa")
  -- vim.cmd("colorscheme everforest")

  -- Neovide cursor effects
  vim.g.neovide_cursor_vfx_mode = "railgun"  -- Cursor effect

  -- Neovide window settings
  vim.g.neovide_remember_window_size = true  -- Remember window size between sessions
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12"  -- Set font and size

  -- Floating window blur effect (currently disabled)
  vim.g.neovide_floating_blur_amount_x = 0.0
  vim.g.neovide_floating_blur_amount_y = 0.0
  vim.g.neovide_window_floating_opacity = 0
  vim.g.neovide_floating_blur = 90
  vim.g.neovide_window_floating_blur = 0
  vim.g.neovide_floating_opacity = 0
  --
  -- vim.g.neovide_window_blurred = true
  -- Transparency for floating windows
  -- vim.o.winblend = 80  -- Set transparency for all floating windows

  -- Optionally tweak transparency for specific plugins like Telescope
  -- require('telescope').setup{
  --   defaults = {
  --     winblend = 80,  -- Set transparency for Telescope floating windows
  --   }
  -- }

  -- Optional: Start Neovide in fullscreen mode (uncomment if needed)
  -- vim.g.neovide_fullscreen = true

  -- Optional: Enable Neovide profiler (uncomment for performance monitoring)
  -- vim.g.neovide_profiler = true
end
