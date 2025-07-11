return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    -- opts = function ()
    --   require "configs.rust-tools"
    -- end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end
  },
  -- {
  --   "mfussenegger/nvim-dap"
  -- },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server", "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier",
      },
    },
  },
  {
  	"nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc", "typescript",
       "html", "css", "markdown", "markdown_inline", "bash", "javascript", "python", "cpp",
  		},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
  	},
  },
  {
    -- luarocks.nvim is a Neovim plugin designed to streamline the installation
    -- of luarocks packages directly within Neovim. It simplifies the process
    -- of managing Lua dependencies, ensuring a hassle-free experience for
    -- Neovim users.
    -- https://github.com/vhyrro/luarocks.nvim
    "vhyrro/luarocks.nvim",
    -- this plugin needs to run before anything else
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty",
        kitty_method = "normal",
        integrations = {
          -- Notice these are the settings for markdown files
          markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            download_remote_images = false,
            only_render_image_at_cursor = true,
            filetypes = { "markdown", "vimwiki" },
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            filetypes = { "norg" },
          },
          -- This is disabled by default
          -- Detect and render images referenced in HTML files
          -- Make sure you have an html treesitter parser installed
          -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua
          html = {
            enabled = true,
          },
          -- This is disabled by default
          -- Detect and render images referenced in CSS files
          -- Make sure you have a css treesitter parser installed
          -- ~/github/dotfiles-latest/neovim/nvim-lazyvim/lua/plugins/treesitter.lua
          css = {
            enabled = true,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = 40,

        -- This is what I changed to make my images look smaller, like a
        -- thumbnail, the default value is 50
        max_height_window_percentage = 20,
        -- max_height_window_percentage = 40,

        -- toggles images when windows are overlapped
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },

        -- auto show/hide images when the editor gains/looses focus
        editor_only_render_when_focused = true,

        -- auto show/hide images in the correct tmux window
        -- In the tmux.conf add `set -g visual-activity off`
        tmux_show_only_in_active_window = true,

        -- render image files as images when opened
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
      })
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
      default = {

        -- file and directory options
        -- expands dir_path to an absolute path
        -- When you paste a new image, and you hover over its path, instead of:
        -- test-images-img/2024-06-03-at-10-58-55.webp
        -- You would see the entire path:
        -- /Users/linkarzu/github/obsidian_main/999-test/test-images-img/2024-06-03-at-10-58-55.webp
        --
        -- IN MY CASE I DON'T WANT TO USE ABSOLUTE PATHS
        -- if I switch to a nother computer and I have a different username,
        -- therefore a different home directory, that's a problem because the
        -- absolute paths will be pointing to a different directory
        use_absolute_path = false, ---@type boolean

        -- make dir_path relative to current file rather than the cwd
        -- To see your current working directory run `:pwd`
        -- So if this is set to false, the image will be created in that cwd
        -- In my case, I want images to be where the file is, so I set it to true
        relative_to_current_file = true, ---@type boolean

        -- I want to save the images in a directory named after the current file,
        -- but I want the name of the dir to end with `-img`
        dir_path = function()
          return vim.fn.expand("%:t:r") .. "-img"
        end,

        -- If you want to get prompted for the filename when pasting an image
        -- This is the actual name that the physical file will have
        -- If you set it to true, enter the name without spaces or extension `test-image-1`
        -- Remember we specified the extension above
        --
        -- I don't want to give my images a name, but instead autofill it using
        -- the date and time as shown on `file_name` below
        prompt_for_file_name = false, ---@type boolean
        file_name = "%Y-%m-%d-at-%H-%M-%S", ---@type string

        -- -- Set the extension that the image file will have
        -- -- I'm also specifying the image options with the `process_cmd`
        -- -- Notice that I HAVE to convert the images to the desired format
        -- -- If you don't specify the output format, you won't see the size decrease

        -- extension = "avif", ---@type string
        -- process_cmd = "convert - -quality 75 avif:-", ---@type string

        -- extension = "webp", ---@type string
        -- process_cmd = "convert - -quality 75 webp:-", ---@type string

        extension = "png", ---@type string
        process_cmd = "convert - -quality 75 png:-", ---@type string

        -- extension = "jpg", ---@type string
        -- process_cmd = "convert - -quality 75 jpg:-", ---@type string

        -- -- Here are other conversion options to play around
        -- -- Notice that with this other option you resize all the images
        -- process_cmd = "convert - -quality 75 -resize 50% png:-", ---@type string

        -- -- Other parameters I found in stackoverflow
        -- -- https://stackoverflow.com/a/27269260
        -- --
        -- -- -depth value
        -- -- Color depth is the number of bits per channel for each pixel. For
        -- -- example, for a depth of 16 using RGB, each channel of Red, Green, and
        -- -- Blue can range from 0 to 2^16-1 (65535). Use this option to specify
        -- -- the depth of raw images formats whose depth is unknown such as GRAY,
        -- -- RGB, or CMYK, or to change the depth of any image after it has been read.
        -- --
        -- -- compression-filter (filter-type)
        -- -- compression level, which is 0 (worst but fastest compression) to 9 (best but slowest)
        -- process_cmd = "convert - -depth 24 -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 png:-",
        --
        -- -- These are for jpegs
        -- process_cmd = "convert - -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace RGB -quality 75 jpg:-",
        -- process_cmd = "convert - -strip -interlace Plane -gaussian-blur 0.05 -quality 75 jpg:-",
        --
      },

      -- filetype specific options
      filetypes = {
        markdown = {
          -- encode spaces and special characters in file path
          url_encode_path = true, ---@type boolean

          -- -- The template is what specifies how the alternative text and path
          -- -- of the image will appear in your file
          --
          -- -- $CURSOR will paste the image and place your cursor in that part so
          -- -- you can type the "alternative text", keep in mind that this will
          -- -- not affect the name that the image physically has
          -- template = "![$CURSOR]($FILE_PATH)", ---@type string
          --
          -- -- This will just statically type "Image" in the alternative text
          -- template = "![Image]($FILE_PATH)", ---@type string
          --
          -- -- This will dynamically configure the alternative text to show the
          -- -- same that you configured as the "file_name" above
          template = "![$FILE_NAME]($FILE_PATH)", ---@type string
        },
      },
    },
    keys = {
      -- suggested keymap
      -- { "<leader>v", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  }
}
