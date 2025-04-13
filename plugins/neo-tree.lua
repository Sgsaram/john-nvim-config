return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
    },
    lazy = false,
	keys = {
		{ "<leader>pe", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    },
	opts = {
		popup_border_style = "rounded",
		filesystem = {
            hijack_netrw_behavior = "open_current",
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false,
            },
        },
		event_handlers = {
            {
                event = "file_opened",
                handler = function(_)
                    require("neo-tree").close_all()
                end
            },
        },
		window = {
            position = "float",
        },
	},
    config = true,
}
