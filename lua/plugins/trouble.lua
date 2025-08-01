return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	lazy = false,
	config = function()
		local trouble = require("trouble")
		trouble.setup()
		vim.keymap.set(
			"n",
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			{ desc = "Diagnostics for the current buffer and errors from the current project" }
		)
	end,
	-- keys = {
	-- 	{
	-- 		"<leader>xx",
	-- 		"<cmd>Trouble diagnostics toggle<cr>",
	-- 		desc = "Diagnostics (Trouble)",
	-- 	},
	-- 	{
	-- 		"<leader>xX",
	-- 		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	-- 		desc = "Buffer Diagnostics (Trouble)",
	-- 	},
	-- {
	--   "<leader>cs",
	--   "<cmd>Trouble symbols toggle focus=false<cr>",
	--   desc = "Symbols (Trouble)",
	-- },
	-- {
	--   "<leader>cl",
	--   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	--   desc = "LSP Definitions / references / ... (Trouble)",
	-- },
	-- {
	--   "<leader>xL",
	--   "<cmd>Trouble loclist toggle<cr>",
	--   desc = "Location List (Trouble)",
	-- },
	-- {
	--   "<leader>xQ",
	--   "<cmd>Trouble qflist toggle<cr>",
	--   desc = "Quickfix List (Trouble)",
	-- },
	-- },
}
