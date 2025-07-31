-- ~/.config/nvim/lua/config/options.lua
-- Neovim options and settings

local opt = vim.opt

-- Line numbers
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers

-- Indentation
opt.tabstop = 4        -- Number of spaces that a <Tab> counts for
opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Smart autoindenting when starting a new line

-- Search
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true  -- Override ignorecase if search contains uppercase
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Show search matches as you type

-- Appearance
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.signcolumn = "yes"   -- Always show sign column
opt.wrap = false         -- Don't wrap lines
opt.scrolloff = 8        -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8    -- Keep 8 columns left/right of cursor

-- Behavior
opt.hidden = true       -- Allow hidden buffers
opt.backup = false      -- Don't create backup files
opt.writebackup = false -- Don't create backup before overwriting
opt.swapfile = false    -- Don't create swap files
opt.undofile = true     -- Enable persistent undo
opt.updatetime = 300    -- Faster completion (4000ms default)
opt.timeoutlen = 500    -- Time to wait for a mapped sequence

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Splits
opt.splitbelow = true -- Force horizontal splits below current window
opt.splitright = true -- Force vertical splits right of current window
