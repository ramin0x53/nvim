-- ~/.config/nvim/lua/plugins/specs/init.lua
-- This file serves as an index for all plugin specifications

-- Return an empty table for now
-- As we add plugins, we'll create separate files in this directory
-- and lazy.nvim will automatically load them

return {
    -- Load colorscheme plugin
    require("plugins.specs.colorscheme"),

    -- Load Go development plugins
    require("plugins.specs.golang"),

    -- Load Rust development plugins
    require("plugins.specs.rust"),

    -- Load Node.js development plugins
    require("plugins.specs.nodejs"),

    -- Load Telescope and file browser
    require("plugins.specs.telescope"),

    -- Future plugin specs will be added here:
    -- require("plugins.specs.file-explorer"),
    -- etc.
}
