-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
M.ui = {
  -- theme = "catppuccin_latte",
  transparency = false 
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
-- M.plugins = "custom.plugins"

M.base46 = {
  theme = "gruvchad",
  transparency = false 


  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
return M
