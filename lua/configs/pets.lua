if vim.fn.getenv("TERM") == "xterm-kitty" then
  require("pets").setup({
    row = 6, -- the row (height) to display the pet at
    col = 0, -- the column to display the pet at
    speed_multiplier = 1.2, -- speed of the pet animation
    default_pet = "slime", -- default pet
    default_style = "blue", -- style of the pet
    random = true, -- use a random pet for PetNew command
    death_animation = true, -- animate the pet's death
    popup = {
      width = "100%", -- width of the popup
      -- winblend = 100, -- winblend value for transparency
      hl = { Normal = "Normal" }, -- highlight group for popup
      avoid_statusline = true, -- avoid covering the statusline
      -- border = "none", -- remove the box or border around the pet popup
    },
    -- require('hologram').setup{
    --   auto_display = true -- WIP automatic markdown image display, may be prone to breaking
    -- }
  })
end
