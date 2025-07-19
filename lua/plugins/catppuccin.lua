return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup()
		local latte = "catppuccin-latte"
		local mocha = "catppuccin-mocha"
		local current_color_scheme
		local toggleColorSchme = function()
			if current_color_scheme == latte then
				current_color_scheme = mocha
			else
				current_color_scheme = latte
			end
			vim.cmd.colorscheme(current_color_scheme) -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
		end
		toggleColorSchme()
		vim.keymap.set("n", "<leader>tc", toggleColorSchme, { desc = "Toggle Theme" })
	end,
}
