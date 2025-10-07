-- ~/.config/nvim/lua/config/keymaps.lua
-- Key mappings

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Clear search highlighting
keymap("n", "<leader>+h", ":nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Better paste
keymap("v", "p", '"_dP', { desc = "Paste without yanking replaced text" })

-- Telescope keymaps
-- General Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })

-- File browser
keymap("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", { desc = "File explorer" })
keymap("n", "<leader>fE", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", { desc = "File explorer (current dir)" })

-- Git (if you have git integration)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })

-- LSP (these will work with your existing LSP setup)
keymap("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP references" })
keymap("n", "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP definitions" })
keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
keymap("n", "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace symbols" })
