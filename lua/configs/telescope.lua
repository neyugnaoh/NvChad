
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                -- Scroll preview window in insert mode
                ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
                ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
            },
            n = {
                -- Scroll preview window in normal mode
                ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
                ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
            },
        },
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

