require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Personal/obsidian-notes",
      strict = true,
    },
  },
  daily_notes = {
    folder = "Daily Notes",
    date_format = "%Y-%m-%d",
    template = "~/Personal/obsidian-notes/Personal/Templates/Daily Note Template.md",
  },
  templates = {
    folder = "Personal/Templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
  notes_subdir = "notes",
  new_notes_location = "notes_subdir",
  attachments = {
    img_folder = "Images",  -- This is the default

  },
  open_app_foreground = false,
})

-- Obsidian key mappings
local map = vim.keymap.set

map("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Obsidian Search" })
map("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Obsidian New Note" })
map("n", "<leader>od", ":ObsidianDailies<CR>", { desc = "Obsidian Dailies" })
map("n", "<leader>oy", ":ObsidianYesterday<CR>", { desc = "Obsidian Yesterday" })
map("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Obsidian Today" })
map("n", "<leader>oT", ":ObsidianTomorrow<CR>", { desc = "Obsidian Tomorrow" })
map("n", "<leader>or", ":ObsidianRename<CR>", { desc = "Obsidian Rename" })
map("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" })
map("n", "<leader>op", ":ObsidianPasteImg<CR>", { desc = "Obsidian Paste Image" })
map("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Obsidian Open" })
map("n", "<leader>om", ":ObsidianTOC<CR>", { desc = "Obsidian table of content" })
