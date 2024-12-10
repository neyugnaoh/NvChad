local plugins = {
  {
    -- init.lua
    ["shaun-mathew/Chameleon.nvim"] = {
      after = "ui",
      config = function()
        require("chameleon").setup()
      end,
    }
  }
}

return plugins
