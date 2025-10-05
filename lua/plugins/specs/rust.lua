-- ~/.config/nvim/lua/plugins/specs/rust.lua
-- Rust development plugins and configuration

return {
    -- Treesitter for syntax highlighting (extending existing config)
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if opts.ensure_installed == "all" then
                return
            end
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "rust",
                "toml",
            })
        end,
    },

    -- Mason LSP manager (must be set up first)
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                }
            })
        end,
    },

    -- Mason LSP Configuration (extending existing config)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {
                "rust_analyzer", -- Rust LSP server
            })
        end,
    },

    -- Rust-specific tooling
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                -- Plugin configuration
                tools = {
                    -- Automatically set inlay hints (type hints)
                    inlay_hints = {
                        auto = true,
                    },
                },
                -- LSP configuration
                server = {
                    on_attach = function(client, bufnr)
                        local opts = { buffer = bufnr, silent = true }

                        -- LSP keymaps
                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                        vim.keymap.set("n", "<leader>f", function()
                            vim.lsp.buf.format({ async = true })
                        end, opts)

                        -- Rust specific mappings
                        vim.keymap.set("n", "<leader>rc", function()
                            vim.cmd.RustLsp("codeAction")
                        end, { desc = "Rust Code Action", buffer = bufnr })
                        vim.keymap.set("n", "<leader>rd", function()
                            vim.cmd.RustLsp("debuggables")
                        end, { desc = "Rust Debuggables", buffer = bufnr })
                        vim.keymap.set("n", "<leader>rr", function()
                            vim.cmd.RustLsp("runnables")
                        end, { desc = "Rust Runnables", buffer = bufnr })
                        vim.keymap.set("n", "<leader>rt", function()
                            vim.cmd.RustLsp("testables")
                        end, { desc = "Rust Testables", buffer = bufnr })
                    end,
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                            },
                            -- Add clippy lints for Rust.
                            checkOnSave = {
                                allFeatures = true,
                                command = "clippy",
                                extraArgs = { "--no-deps" },
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                    ["napi-derive"] = { "napi" },
                                    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                        },
                    },
                },
            }
        end,
    },

    -- Crates.io integration
    {
        "saecki/crates.nvim",
        tag = "stable",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup({
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
                popup = {
                    border = "rounded",
                },
            })
        end,
        ft = { "toml" },
    },

    -- Test runner for Rust
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = {
            "rouge8/neotest-rust",
        },
        opts = {
            adapters = {
                ["neotest-rust"] = {},
            },
        },
    },

    -- Debugging support
    {
        "mfussenegger/nvim-dap",
        optional = true,
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = function(_, opts)
                    opts.ensure_installed = opts.ensure_installed or {}
                    vim.list_extend(opts.ensure_installed, { "codelldb" })
                end,
            },
        },
        opts = function()
            local dap = require("dap")
            if not dap.adapters["codelldb"] then
                require("dap").adapters["codelldb"] = {
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "codelldb",
                        args = {
                            "--port",
                            "${port}",
                        },
                    },
                }
            end
            for _, lang in ipairs({ "rust" }) do
                dap.configurations[lang] = {
                    {
                        type = "codelldb",
                        request = "launch",
                        name = "Launch file",
                        program = function()
                            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                        end,
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "codelldb",
                        request = "attach",
                        name = "Attach to process",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                }
            end
        end,
    },
}