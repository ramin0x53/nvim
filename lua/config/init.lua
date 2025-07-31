-- ~/.config/nvim/lua/config/init.lua
-- Loads all configuration modules in the correct order

-- Load core Neovim settings first
require("config.options")

-- Load keymaps
require("config.keymaps")

-- Load autocmds
require("config.autocmds")

-- Load plugins (this will set up the plugin manager and load plugins)
require("plugins")
