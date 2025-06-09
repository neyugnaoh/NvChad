require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Personal/obsidian-notes",
      strict = true,
    },
  },
  daily_notes = {
    folder = "Calendar/DailyNotes",
    date_format = "%Y-%m-%d",
    template = "~/Personal/obsidian-notes/Extras/Templates/Daily Note Template.md",
  },
  templates = {
    folder = "Extras/Templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
  notes_subdir = "Cards",
  new_notes_location = "notes_subdir",
  attachments = {
    img_folder = "Extras/Images",  -- This is the default

  },
  open_app_foreground = false,
  disable_frontmatter = false,
  note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    local date_str = os.date("%Y-%m-%d", note.creation_date)

    if note.metadata == nil then
      note.metadata = {}
    end
    -- if note.title then
    --   note:add_alias(note.title)
    -- end

    local out = {
      id = note.id,
      aliases = note.aliases,
      tags = note.tags,
      date = note.date or date_str,
    }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,
})

-- Obsidian key mappings
local map = vim.keymap.set

map("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Obsidian Search" })
map("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Obsidian New Note" })
map("n", "<leader>oN", ":ObsidianNewFromTemplate<CR>", { desc = "Obsidian New Note From Template" })
map("n", "<leader>od", ":ObsidianDailies<CR>", { desc = "Obsidian Dailies" })
map("n", "<leader>oy", ":ObsidianYesterday<CR>", { desc = "Obsidian Yesterday" })
map("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Obsidian Today" })
map("n", "<leader>oT", ":ObsidianTomorrow<CR>", { desc = "Obsidian Tomorrow" })
map("n", "<leader>or", ":ObsidianRename<CR>", { desc = "Obsidian Rename" })
map("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" })
map("n", "<leader>op", ":ObsidianPasteImg<CR>", { desc = "Obsidian Paste Image" })
map("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Obsidian Open" })
map("n", "<leader>om", ":ObsidianTOC<CR>", { desc = "Obsidian table of content" })
