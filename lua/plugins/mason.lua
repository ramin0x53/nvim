local options = {
    PATH = "skip",

    ui = {
        icons = {
            package_pending = " ",
            package_installed = "󰄳 ",
            package_uninstalled = " 󰚌",
        },

        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
            cancel_installation = "<C-c>",
        },
    },

    max_concurrent_installers = 10,
}

return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
        return options
    end,
    config = function(_, opts)
        require("mason").setup(opts)

        -- vim.api.nvim_create_user_command("MasonInstallAll", function()
        --     require("nvchad.mason").install_all(opts.ensure_installed)
        -- end, {})
    end,
}
