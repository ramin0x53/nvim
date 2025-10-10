-- ~/.config/nvim/lua/plugins/specs/mason.lua
-- Centralized Mason setup for LSP servers and tools

return {
    -- Mason core UI/setup
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = { border = "rounded" },
            })
        end,
    },

    -- mason-lspconfig to auto-install LSP servers
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- Go / Lua
                    "gopls",
                    "lua_ls",

                    -- Rust
                    "rust_analyzer",

                    -- Web / Node.js
                    "ts_ls",
                    "eslint",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "jsonls",
                    "svelte",
                },
                automatic_installation = true,
            })
        end,
    },
}
