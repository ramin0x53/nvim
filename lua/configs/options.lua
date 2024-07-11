vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("xnoremap p pgvy")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set relativenumber")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.number = true


vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
