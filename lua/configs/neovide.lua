if vim.g.neovide then
  -- Neovide configuration
  vim.g.neovide_transparency = 0.9  -- Set transparency level (0-1)
  --
  -- vim.g.transparency = 0.8
  vim.g.neovide_text_gamma = 0.0  -- Adjust text gamma
  vim.g.neovide_text_contrast = 1.0  -- Adjust text contrast
  vim.g.neovide_hide_mouse_when_typing = true  -- Hide mouse when typing

  -- Enable true color
  vim.opt.termguicolors = true

  -- Neovide cursor effects
  vim.g.neovide_cursor_vfx_mode = "railgun"  -- Cursor effect
  vim.g.neovide_hide_menu = true
  vim.g.neovide_frameless = true
  -- Neovide window settings
  vim.g.neovide_remember_window_size = true  -- Remember window size between sessions
  -- vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12"  -- Set font and size
  vim.o.guifont = "BlexMono Nerd Font Mono:h14"  -- Set font and size

  vim.g.neovide_show_border = false
  -- Floating window blur effect (currently disabled)
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_window_floating_opacity = 1.0

  vim.g.neovide_floating_corner_radius = 1.0
  vim.g.neovide_floating_blur = 90
  vim.g.neovide_window_floating_blur = 0
  vim.g.neovide_floating_opacity = 90
  vim.api.nvim_set_keymap("n", "<F11>", ":lua ToggleFullScreen()<CR>", { noremap = true, silent = true })

  --
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5

  function ToggleFullScreen()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    if vim.g.neovide_fullscreen then
      vim.g.neovide_transparency = 0.8 -- Adjust transparency for full-screen
    else
      vim.g.neovide_transparency = 0.8 -- Reapply normal transparency
    end
  end
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
