vim.g.mapleader = " "

vim.opt.scrolloff = 8
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.smartcase = true

vim.keymap.set("n", "<c-k>", "<cmd>:wincmd k<cr>", { silent = true })
vim.keymap.set("n", "<c-j>", "<cmd>:wincmd j<cr>", { silent = true })
vim.keymap.set("n", "<c-h>", "<cmd>:wincmd h<cr>", { silent = true })
vim.keymap.set("n", "<c-l>", "<cmd>:wincmd l<cr>", { silent = true })

vim.keymap.set("n", "<c-->", "<cmd>:split<cr>", { silent = true })
vim.keymap.set("n", "<c-\\>", "<cmd>:vsplit<cr>", { silent = true })
