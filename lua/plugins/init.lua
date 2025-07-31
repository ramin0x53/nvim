-- ~/.config/nvim/lua/plugins/init.lua
-- Plugin manager setup using lazy.nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    -- Plugin specifications will be loaded from lua/plugins/specs/
    spec = "plugins.specs",

    -- Configure lazy.nvim
    defaults = {
        lazy = false, -- should plugins be lazy-loaded by default?
    },

    -- UI settings
    ui = {
        border = "rounded",
    },

    -- Performance settings
    performance = {
        rtp = {
            -- Disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- Key mapping to open lazy.nvim
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open Lazy" })
