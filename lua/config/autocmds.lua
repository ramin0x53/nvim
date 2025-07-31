-- ~/.config/nvim/lua/config/autocmds.lua
-- Auto commands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

-- Remove whitespace on save
augroup("RemoveWhitespace", { clear = true })
autocmd("BufWritePre", {
    group = "RemoveWhitespace",
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})

-- Don't auto comment new line
augroup("NoAutoComment", { clear = true })
autocmd("BufEnter", {
    group = "NoAutoComment",
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor position
augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
    group = "RestoreCursor",
    pattern = "*",
    callback = function()
        local line = vim.fn.line("'\"")
        if line > 1 and line <= vim.fn.line("$") then
            vim.cmd('normal! g`"')
        end
    end,
})

-- Close certain filetypes with q
augroup("CloseWithQ", { clear = true })
autocmd("FileType", {
    group = "CloseWithQ",
    pattern = { "help", "man", "qf", "query" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
    end,
})
