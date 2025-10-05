-- ~/.config/nvim/lua/config/keymaps.lua
-- Key mappings

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Clear search highlighting
keymap("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlighting" })

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

-- Quick save
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Quick quit
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Split windows
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
keymap("n", "<leader>sc", ":close<CR>", { desc = "Close current split" })

-- Go development mappings
keymap("n", "<leader>gr", "<cmd>GoRun<cr>", { desc = "Go run" })
keymap("n", "<leader>gb", "<cmd>GoBuild<cr>", { desc = "Go build" })
keymap("n", "<leader>gt", "<cmd>GoTest<cr>", { desc = "Go test" })
keymap("n", "<leader>gT", "<cmd>GoTestFunc<cr>", { desc = "Go test function" })
keymap("n", "<leader>gc", "<cmd>GoCoverage<cr>", { desc = "Go coverage" })
keymap("n", "<leader>gf", "<cmd>GoFmt<cr>", { desc = "Go format" })
keymap("n", "<leader>gi", "<cmd>GoImport<cr>", { desc = "Go import" })
keymap("n", "<leader>gm", "<cmd>GoMod tidy<cr>", { desc = "Go mod tidy" })

-- Test runner mappings
keymap("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Run nearest test" })
keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Run file tests" })
keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Toggle test summary" })
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", { desc = "Show test output" })
