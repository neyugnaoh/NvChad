local map = vim.keymap.set
local opts = { silent = true, noremap = true, desc = "" }

-- Leader mappings
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })

-- Escape
map("i", "jk", "<ESC>", opts)

-- Save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Arrow key remaps
map("n", "<Up>", "k", opts)
map("n", "<Down>", "j", opts)
map("n", "<Left>", "h", opts)
map("n", "<Right>", "l", opts)
map("i", "<Up>", "<NOP>", opts)
map("i", "<Down>", "<NOP>", opts)
map("i", "<Left>", "<NOP>", opts)
map("i", "<Right>", "<NOP>", opts)

-- Clipboard (Mac)
map("n", "<D-v>", '"+p', opts)
map("i", "<D-v>", "<C-r>+", opts)

-- Terminal mode
map("t", "<Esc>", "<C-\\><C-n>", opts)
map("t", "<A-h>", "<C-\\><C-n>h", opts)
map("t", "<A-j>", "<C-\\><C-n>j", opts)
map("t", "<A-k>", "<C-\\><C-n>k", opts)
map("t", "<A-l>", "<C-\\><C-n>l", opts)

-- Resize splits
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file explorer" })


map("n", "<C-h>", "<C-w>h", opts) -- move to left split
map("n", "<C-j>", "<C-w>j", opts) -- move to below split
map("n", "<C-k>", "<C-w>k", opts) -- move to above split
map("n", "<C-l>", "<C-w>l", opts) -- move to right split
