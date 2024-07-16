return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "VonHeikemen/lsp-zero.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    lazy = false,
    config = function()
		local mason_lspconfig = require("mason-lspconfig")
		require("mason").setup({})
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"clangd",
				"marksman",
                "html",
                "cssls",
                "tsserver",
                "tailwindcss",
			},
		})
        local lsp_zero = require("lsp-zero")
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end)
        
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                    return
                end
                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths here.
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        })
        lspconfig.pyright.setup({})
        lspconfig.clangd.setup({})
        lspconfig.marksman.setup({})
        lspconfig.html.setup({})
        lspconfig.cssls.setup({})
        lspconfig.tsserver.setup({})
        lspconfig.tailwindcss.setup({})


        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            -- preselect = "item",
            -- completion = {
            --     completeopt = "menu,menuone,noinsert",
            -- },
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "nvim_lsp_signature_help" },
                { name = "buffer" },
                { name = "path" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
                ["<c-e>"] = cmp.mapping.abort(),
                ["<c-k>"] = cmp.mapping.select_prev_item({behavior = "select"}),
                ["<c-j>"] = cmp.mapping.select_next_item({behavior = "select"}),
                ["<c-u>"] = cmp.mapping.scroll_docs(-4),
                ["<c-d>"] = cmp.mapping.scroll_docs(4),
            }),
        })
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            }
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "cmdline" },
                { name = "path" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end
}
