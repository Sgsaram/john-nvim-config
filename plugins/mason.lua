return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		require("mason").setup({})
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"clangd",
				"marksman",
			},
		})
	end
}
