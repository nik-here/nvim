require("lazy").setup({
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{                         -- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup()
		end
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = function()
			require("fidget").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'mfussenegger/nvim-dap',
	'simrat39/rust-tools.nvim',
	"theprimeagen/harpoon",
	"tpope/vim-fugitive",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 900,
		opts = {},
	},
	{
		"folke/which-key.nvim",
		keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
		lazy = false,
		priority = 1000,
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function(_, opts)
			require("which-key").setup(opts)
		end,
	},
})
