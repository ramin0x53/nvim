local options = {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_ignore_patterns = { "node_modules" },
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },

    extensions_list = {},
    extensions = {},
}

local map = vim.keymap.set

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- local builtin = require("telescope.builtin")
        -- vim.keymap.set("n", "<C-p>", builtin.find_files, {})

        local telescope = require "telescope"
        telescope.setup(options)

        map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
        map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
        -- map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
        map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
        map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
        map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>",
            { desc = "telescope find in current buffer" })
        map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
        map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
        -- map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
        -- map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
        map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
        map(
            "n",
            "<leader>fa",
            "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
            { desc = "telescope find all files" }
        )
    end,
}
