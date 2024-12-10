-- Use Option + Enter to accept GitHub Copilot suggestions
-- -- C-CR did not work
-- vim.api.nvim_set_keymap('i', '<M-CR>', 'copilot#Accept("<CR>")', { expr=true, noremap = true, silent = true })

require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      -- open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = false,
    debounce = 75,
    keymap = {
      accept = "<M-CR>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    javascript = true,
    typescript = true,
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})

-- require('avante').setup({
--   ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
--   provider = "copilot", -- Recommend using Claude
--   auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
--   -- claude = {
--   --   endpoint = "https://api.anthropic.com",
--   --   model = "claude-3-5-sonnet-20240620",
--   --   temperature = 0,
--   --   max_tokens = 4096,
--   -- },
--   copilot = {
--     endpoint = "https://api.githubcopilot.com",
--     model = "gpt-4o-2024-05-13",
--     proxy = nil, -- [protocol://]host[:port] Use this proxy
--     allow_insecure = false, -- Allow insecure server connections
--     timeout = 30000, -- Timeout in milliseconds
--     temperature = 0,
--     max_tokens = 4096,
--   },
--   behaviour = {
--     auto_suggestions = true, -- Experimental stage
--     auto_set_highlight_group = true,
--     auto_set_keymaps = true,
--     auto_apply_diff_after_generation = false,
--     support_paste_from_clipboard = false,
--   },
--   mappings = {
--     --- @class AvanteConflictMappings
--     diff = {
--       ours = "co",
--       theirs = "ct",
--       all_theirs = "ca",
--       both = "cb",
--       cursor = "cc",
--       next = "]x",
--       prev = "[x",
--     },
--     suggestion = {
--       accept = "<M-l>",
--       next = "<M-]>",
--       prev = "<M-[>",
--       dismiss = "<C-]>",
--     },
--     jump = {
--       next = "]]",
--       prev = "[[",
--     },
--     submit = {
--       normal = "<CR>",
--       insert = "<C-s>",
--     },
--     sidebar = {
--       apply_all = "A",
--       apply_cursor = "a",
--       switch_windows = "<Tab>",
--       reverse_switch_windows = "<S-Tab>",
--     },
--   },
--   hints = { enabled = true },
--   windows = {
--     ---@type "right" | "left" | "top" | "bottom"
--     position = "right", -- the position of the sidebar
--     wrap = true, -- similar to vim.o.wrap
--     width = 30, -- default % based on available width
--     sidebar_header = {
--       align = "center", -- left, center, right for title
--       rounded = true,
--     },
--     input = {
--       prefix = "> ",
--     },
--     edit = {
--       border = "rounded",
--       start_insert = true, -- Start insert mode when opening the edit window
--     },
--     ask = {
--       floating = false, -- Open the 'AvanteAsk' prompt in a floating window
--       start_insert = true, -- Start insert mode when opening the ask window, only effective if floating = true.
--       border = "rounded",
--     },
--   },
--   highlights = {
--     ---@type AvanteConflictHighlights
--     diff = {
--       current = "DiffText",
--       incoming = "DiffAdd",
--     },
--   },
--   --- @class AvanteConflictUserConfig
--   diff = {
--     autojump = true,
--     ---@type string | fun(): any
--     list_opener = "copen",
--   },
-- })
