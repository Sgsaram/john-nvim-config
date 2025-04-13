return {
	"nvim-telescope/telescope.nvim",
    branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
    lazy = false,
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<c-k>"] = actions.move_selection_previous,
						["<c-j>"] = actions.move_selection_next,
						["<esc>"] = actions.close,
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>pf",
			function()
				builtin.find_files({hidden = true, no_ignore = true})
			end,
			{desc = "Telescope Find Files"}
		)
		vim.keymap.set("n", "<leader>pw", builtin.live_grep, {desc = "Telescope Live Grep"})
        vim.keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<cr>", {desc = "Telescope Find Todo"})
	end,
}
