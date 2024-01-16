vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.wrap = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.updatetime = 50

vim.g.mapleader = " "

vim.filetype.add({
	extension = {
		qss = "qss",
	},
	filename = {
		["requirements.txt"] = "requirements",
	},
	pattern = {
		[".*/requirements/.*%.txt"] = "requirements",
	},
})
