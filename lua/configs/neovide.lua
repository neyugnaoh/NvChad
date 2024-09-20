

-- if vim.g.neovide then -- Only config when using neovide

  -- Neovide configuration
  vim.g.neovide_transparency = 0.8
  -- vim.g.neovide_profiler = true
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 1.0
  vim.g.neovide_hide_mouse_when_typing = true

  -- Set Kanagawa as the colorscheme
  vim.cmd("colorscheme kanagawa")

  -- Neovide settings
  vim.g.neovide_cursor_vfx_mode = "railgun"  -- Cursor effect
  vim.g.neovide_cursor_animation_length = 0.1  -- Cursor animation speed
  vim.g.neovide_cursor_trail_length = 0.8  -- Cursor trail length
  -- vim.g.neovide_fullscreen = true  -- Start Neovide in fullscreen mode
  vim.g.neovide_remember_window_size = true  -- Remember window size between sessions
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h10"

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

-- end
