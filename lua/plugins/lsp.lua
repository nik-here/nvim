return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"taplo",
			"lua_ls",
			"html",
			"tailwindcss",
			"jsonls",
			"yamlls",
			"markdown_oxide",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
