-- ~/.config/nvim/lua/plugins/specs/telescope.lua
-- Telescope fuzzy finder and file browser configuration

return {
    -- Telescope fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            -- Telescope extensions
            "nvim-telescope/telescope-file-browser.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local fb_actions = require("telescope._extensions.file_browser.actions")

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "truncate" },
                    file_ignore_patterns = { "%.git/", "node_modules/", "%.cache/" },
                    
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-x>"] = actions.delete_buffer,
                        },
                        n = {
                            ["q"] = actions.close,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-x>"] = actions.delete_buffer,
                        },
                    },
                },
                
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mappings
                                ["<A-c>"] = fb_actions.create,
                                ["<S-CR>"] = fb_actions.create_from_prompt,
                                ["<A-r>"] = fb_actions.rename,
                                ["<A-m>"] = fb_actions.move,
                                ["<A-y>"] = fb_actions.copy,
                                ["<A-d>"] = fb_actions.remove,
                                ["<C-o>"] = fb_actions.open,
                                ["<C-g>"] = fb_actions.goto_parent_dir,
                                ["<C-e>"] = fb_actions.goto_home_dir,
                                ["<C-w>"] = fb_actions.goto_cwd,
                                ["<C-t>"] = fb_actions.change_cwd,
                                ["<C-f>"] = fb_actions.toggle_browser,
                                ["<C-h>"] = fb_actions.toggle_hidden,
                                ["<C-s>"] = fb_actions.toggle_all,
                            },
                            ["n"] = {
                                -- your custom normal mode mappings
                                ["c"] = fb_actions.create,
                                ["r"] = fb_actions.rename,
                                ["m"] = fb_actions.move,
                                ["y"] = fb_actions.copy,
                                ["d"] = fb_actions.remove,
                                ["o"] = fb_actions.open,
                                ["g"] = fb_actions.goto_parent_dir,
                                ["e"] = fb_actions.goto_home_dir,
                                ["w"] = fb_actions.goto_cwd,
                                ["t"] = fb_actions.change_cwd,
                                ["f"] = fb_actions.toggle_browser,
                                ["h"] = fb_actions.toggle_hidden,
                                ["s"] = fb_actions.toggle_all,
                            },
                        },
                    },
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    },
                },
            })

            -- Load telescope extensions
            telescope.load_extension("file_browser")
            if vim.fn.executable("make") == 1 then
                telescope.load_extension("fzf")
            end
        end,
    },
}