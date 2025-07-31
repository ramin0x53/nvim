-- ~/.config/nvim/lua/plugins/specs/init.lua
-- This file serves as an index for all plugin specifications

-- Return an empty table for now
-- As we add plugins, we'll create separate files in this directory
-- and lazy.nvim will automatically load them

return {
    -- Load colorscheme plugin
    require("plugins.specs.colorscheme"),

    -- Future plugin specs will be added here:
    -- require("plugins.specs.treesitter"),
    -- require("plugins.specs.lsp"),
    -- etc.
}
