return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"VonHeikemen/lsp-zero.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({buffer = bufnr})
		end)

		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.clangd.setup({})
		lspconfig.marksman.setup({})

		local cmp = require("cmp")
		cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			sources = {
				{name = "nvim_lsp"},
				{name = "nvim_lua"},
			},
			mapping = cmp.mapping.preset.insert({
				["<cr>"] = cmp.mapping.confirm({select = false}),
				["<c-e>"] = cmp.mapping.abort(),
				["<c-k>"] = cmp.mapping.select_prev_item({behavior = "select"}),
				["<c-j>"] = cmp.mapping.select_next_item({behavior = "select"}),
				["<c-u>"] = cmp.mapping.scroll_docs(-4),
				["<c-d>"] = cmp.mapping.scroll_docs(4),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end
}
