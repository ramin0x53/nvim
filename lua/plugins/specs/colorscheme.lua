-- ~/.config/nvim/lua/plugins/specs/colorscheme.lua
-- Catppuccin theme configuration

return {
    -- Catppuccin (soothing pastel theme for the high-spirited!)
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,    -- Load immediately
        priority = 1000, -- Load before other plugins
        config = function()
            require("catppuccin").setup({
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false, -- disables setting the background color.
                float = {
                    transparent = false, -- enable transparent floating windows
                    solid = false,  -- use solid styling for floating windows, see |winborder|
                },
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false,  -- Force no italic
                no_bold = false,    -- Force no bold
                no_underline = false, -- Force no underline
                styles = {          -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                    -- miscs = {}, -- Uncomment to turn off hard-coded styles
                },
                lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                color_overrides = {},
                custom_highlights = function(colors)
                    return {
                        -- Make background completely black
                        Normal = { bg = "#000000" },
                        NormalFloat = { bg = "#000000" },
                        NormalNC = { bg = "#000000" }, -- Non-current windows
                        SignColumn = { bg = "#000000" },
                        EndOfBuffer = { bg = "#000000" },
                        -- You might also want to adjust these for consistency
                        StatusLine = { bg = "#000000" },
                        StatusLineNC = { bg = "#000000" },
                        TabLine = { bg = "#000000" },
                        TabLineFill = { bg = "#000000" },
                        WinSeparator = { bg = "#000000" },
                    }
                end,
                default_integrations = true,
                auto_integrations = false,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })

            -- Set the colorscheme to specifically use mocha variant
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
}
