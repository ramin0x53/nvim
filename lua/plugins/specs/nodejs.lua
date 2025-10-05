-- ~/.config/nvim/lua/plugins/specs/nodejs.lua
-- Node.js/JavaScript/TypeScript development plugins and configuration

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
                "javascript",
                "typescript",
                "tsx",
                "json",
                "jsonc",
                "html",
                "css",
                "scss",
                "vue",
                "svelte",
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
                "ts_ls", -- TypeScript/JavaScript LSP server (updated from tsserver)
                "eslint", -- ESLint LSP server
                "html", -- HTML LSP server
                "cssls", -- CSS LSP server
                "tailwindcss", -- Tailwind CSS LSP server
                "jsonls", -- JSON LSP server
                "volar", -- Vue.js LSP server
                "svelte", -- Svelte LSP server
            })
        end,
    },

    -- Additional LSP configuration
    {
        "neovim/nvim-lspconfig",
        opts = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Common on_attach function
            local on_attach = function(client, bufnr)
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

                -- TypeScript specific mappings
                if client.name == "ts_ls" then
                    vim.keymap.set("n", "<leader>to", "<cmd>TypescriptOrganizeImports<cr>", opts)
                    vim.keymap.set("n", "<leader>tr", "<cmd>TypescriptRenameFile<cr>", opts)
                    vim.keymap.set("n", "<leader>ti", "<cmd>TypescriptAddMissingImports<cr>", opts)
                    vim.keymap.set("n", "<leader>tu", "<cmd>TypescriptRemoveUnused<cr>", opts)
                end
            end

            -- TypeScript/JavaScript server
            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                },
            })

            -- ESLint server
            lspconfig.eslint.setup({
                on_attach = function(client, bufnr)
                    on_attach(client, bufnr)
                    -- Auto-fix on save
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
                capabilities = capabilities,
            })

            -- HTML server
            lspconfig.html.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- CSS server
            lspconfig.cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Tailwind CSS server
            lspconfig.tailwindcss.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- JSON server
            lspconfig.jsonls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })

            -- Vue.js server
            lspconfig.volar.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Svelte server
            lspconfig.svelte.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end,
    },

    -- Package.json dependency management
    {
        "vuki656/package-info.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("package-info").setup({
                colors = {
                    up_to_date = "#3C4048",
                    outdated = "#d19a66",
                },
                icons = {
                    enable = true,
                    style = {
                        up_to_date = "|  ",
                        outdated = "|  ",
                    },
                },
                autostart = true,
                hide_up_to_date = false,
                hide_unstable_versions = false,
            })
        end,
        ft = "json",
    },

    -- TypeScript utilities
    {
        "jose-elias-alvarez/typescript.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("typescript").setup({
                disable_commands = false,
                debug = false,
                go_to_source_definition = {
                    fallback = true,
                },
            })
        end,
        ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    },

    -- Schema store for JSON
    {
        "b0o/schemastore.nvim",
        lazy = true,
    },

    -- Test runner for JavaScript/TypeScript
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = {
            "nvim-neotest/neotest-jest",
            "marilari88/neotest-vitest",
        },
        opts = {
            adapters = {
                ["neotest-jest"] = {
                    jestCommand = "npm test --",
                    jestConfigFile = "jest.config.js",
                    env = { CI = true },
                    cwd = function()
                        return vim.fn.getcwd()
                    end,
                },
                ["neotest-vitest"] = {},
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
                    vim.list_extend(opts.ensure_installed, { "node-debug2-adapter" })
                end,
            },
        },
        opts = function()
            local dap = require("dap")
            if not dap.adapters["node2"] then
                dap.adapters["node2"] = {
                    type = "executable",
                    command = "node",
                    args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
                }
            end
            for _, lang in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
                dap.configurations[lang] = {
                    {
                        type = "node2",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = vim.fn.getcwd(),
                        sourceMaps = true,
                        protocol = "inspector",
                        console = "integratedTerminal",
                    },
                    {
                        type = "node2",
                        request = "attach",
                        name = "Attach to process",
                        processId = require("dap.utils").pick_process,
                        cwd = vim.fn.getcwd(),
                        sourceMaps = true,
                        protocol = "inspector",
                    },
                }
            end
        end,
    },

    -- Prettier formatting
    {
        "jose-elias-alvarez/null-ls.nvim",
        optional = true,
        opts = function(_, opts)
            local null_ls = require("null-ls")
            opts.sources = opts.sources or {}
            vim.list_extend(opts.sources, {
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "jsonc",
                        "yaml",
                        "markdown",
                        "graphql",
                        "handlebars",
                    },
                }),
            })
        end,
    },
}