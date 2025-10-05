-- ~/.config/nvim/lua/plugins/specs/colorscheme.lua
-- OneDark Pro theme configuration

return {
    -- OneDark Pro (VS Code inspired) - Active theme
    {
        "olimorris/onedarkpro.nvim",
        lazy = false, -- Load immediately
        priority = 1000, -- Load before other plugins
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
            
            -- Set the colorscheme to OneDark Dark variant
            vim.cmd([[colorscheme onedark_dark]])
        end,
    },
}
