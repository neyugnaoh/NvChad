if vim.g.neovide then -- Only configure when using Neovide

  -- Neovide configuration
  vim.g.neovide_transparency = 0.8  -- Set transparency level (0-1)
  vim.g.neovide_text_gamma = 0.0  -- Adjust text gamma
  vim.g.neovide_text_contrast = 1.0  -- Adjust text contrast
  vim.g.neovide_hide_mouse_when_typing = true  -- Hide mouse when typing

  -- Enable true color (if needed, you can uncomment this)
  vim.opt.termguicolors = true

  -- Set Everforest as the colorscheme
  vim.cmd("colorscheme gruvbox")

  -- Neovide cursor effects
  vim.g.neovide_cursor_vfx_mode = "railgun"  -- Cursor effect

  -- Optionally tweak cursor behavior (uncomment if needed)
  -- vim.g.neovide_cursor_animation_length = 0.1  -- Speed of cursor animation
  -- vim.g.neovide_cursor_trail_length = 0.8  -- Cursor trail length

  -- Neovide window settings
  vim.g.neovide_remember_window_size = true  -- Remember window size between sessions
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h14"  -- Set font and size

  -- Floating window blur effect
  vim.g.neovide_floating_blur_amount_x = 2.0  -- Horizontal blur
  vim.g.neovide_floating_blur_amount_y = 2.0  -- Vertical blur

  -- Optional: Start Neovide in fullscreen mode (uncomment if needed)
  -- vim.g.neovide_fullscreen = true

  -- Optional: Enable Neovide profiler (uncomment for performance monitoring)
  -- vim.g.neovide_profiler = true

end
