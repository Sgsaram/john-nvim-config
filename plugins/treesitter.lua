return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"python",
				"requirements",
				"cpp",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"css",
				"yaml",
				"toml",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true }
		})

		vim.treesitter.language.register("css", "qss")
	end
}
