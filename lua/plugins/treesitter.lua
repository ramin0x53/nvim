return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "python", "lua", "go", "javascript", "html", "rust", "cpp", "typescript", "bash", "toml", "json", "ini", "yaml" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
