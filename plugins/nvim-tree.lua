return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = { quit_on_open = true },
			},
			sort = {
				sorter = "name",
				folders_first = true,
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		})
		vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>") 
	end
}
