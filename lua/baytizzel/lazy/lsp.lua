-- lua/baytizzel/lazy/lsp.lua
return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "clangd", "pyright", "zls", "gopls" },
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" }, -- Lazy-load on buffer read/new file
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			-- Global (default) config override
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("zls", {
				cmd = { "zls" },
				filestypes = { "zig", "zir" },
			})

			vim.lsp.config("gopls", {
				cmd = { "gopls" },
				filestypes = { "go" },
			})

			-- clangd config override
			vim.lsp.config("clangd", {
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "yacc", "flex", "bison" },
				cmd = { "clangd", "--background-index" },
			})

			-- pyright config override
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})

			-- Enable both servers
			vim.lsp.enable({ "clangd", "pyright", "zls", "gopls" })
		end,
	},
}
