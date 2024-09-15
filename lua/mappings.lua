require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { silent = true, noremap = true, desc = "" }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Save with Ctrl + s in normal, insert, and visual modes
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
