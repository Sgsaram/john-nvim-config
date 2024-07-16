return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
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
				"elixir",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
