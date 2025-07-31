-- ~/.config/nvim/lua/plugins/specs/colorscheme.lua
-- High contrast colorscheme similar to VS Code Monokai Charcoal

return {
    -- Monokai Pro theme - closest to VS Code Monokai Charcoal
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false, -- Load immediately
        priority = 1000, -- Load before other plugins
        config = function()
            require("monokai-pro").setup({
                transparent_background = false,
                terminal_colors = true,
                devicons = true, -- highlight the icons of `nvim-web-devicons`
                styles = {
                    comment = { italic = true },
                    keyword = { italic = true },
                    type = { italic = true },
                    storageclass = { italic = true },
                    structure = { italic = true },
                    parameter = { italic = true },
                    annotation = { italic = true },
                    tag_attribute = { italic = true },
                },
                filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
                -- Enable this will disable filter option
                day_night = {
                    enable = false,  -- turn off by default
                    day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
                    night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
                },
                inc_search = "background", -- underline | background
                background_clear = {
                    -- "float_win",
                    "toggleterm",
                    "telescope",
                    -- "which-key",
                    "renamer",
                    "notify",
                    -- "nvim-tree",
                    -- "neo-tree",
                    -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
                }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                    },
                    indent_blankline = {
                        context_highlight = "default", -- default | pro
                        context_start_underline = false,
                    },
                },
            })

            -- Set the colorscheme
            vim.cmd([[colorscheme monokai-pro]])
        end,
    },

    -- Alternative: Sonokai (another high contrast Monokai variant)
    {
        "sainnhe/sonokai",
        lazy = true,                   -- Only load if manually activated
        config = function()
            vim.g.sonokai_style = 'atlantis' -- 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
            vim.g.sonokai_better_performance = 1
            vim.g.sonokai_transparent_background = 0
            vim.g.sonokai_enable_italic = 1
            vim.g.sonokai_disable_italic_comment = 0
        end,
    },

    -- Alternative: OneDark Pro (VS Code inspired)
    {
        "olimorris/onedarkpro.nvim",
        lazy = true, -- Only load if manually activated
        config = function()
            require("onedarkpro").setup({
                colors = {}, -- Override default colors
                highlights = {}, -- Override default highlight groups
                styles = {
                    types = "NONE",
                    methods = "NONE",
                    numbers = "NONE",
                    strings = "NONE",
                    comments = "italic",
                    keywords = "bold,italic",
                    constants = "NONE",
                    functions = "italic",
                    operators = "NONE",
                    variables = "NONE",
                    parameters = "NONE",
                    conditionals = "italic",
                    virtual_text = "NONE",
                },
                filetypes = {
                    javascript = true,
                    typescript = true,
                    html = true,
                    css = true,
                    scss = true,
                    less = true,
                    yaml = true,
                    json = true,
                },
                plugins = {
                    native_lsp = true,
                    polygot = true,
                    treesitter = true,
                },
                options = {
                    bold = true,              -- Use the themes opinionated bold styles?
                    italic = true,            -- Use the themes opinionated italic styles?
                    underline = true,         -- Use the themes opinionated underline styles?
                    undercurl = true,         -- Use the themes opinionated undercurl styles?
                    cursorline = false,       -- Use cursorline highlighting?
                    transparency = false,     -- Use a transparent background?
                    terminal_colors = true,   -- Use the theme's colors for Neovim's :terminal?
                    highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
                }
            })
        end,
    },
}
