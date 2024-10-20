require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { silent = true, noremap = true, desc = "" }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Save with Ctrl + s in normal, insert, and visual modes
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- Keybinding configurations
-- vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true, silent = true })
-- Map arrow keys to hjkl
vim.api.nvim_set_keymap('n', '<Up>', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', 'l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true, silent = true })
-- Use Cmd + V to paste from clipboard in normal mode
vim.api.nvim_set_keymap('n', '<D-v>', '"+p', { noremap = true, silent = true })

-- Use Cmd + V to paste in insert mode
vim.api.nvim_set_keymap('i', '<D-v>', '<C-r>+', { noremap = true, silent = true })

-- Shortcut mapping when using terminal emulator

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n>l', { noremap = true, silent = true })



