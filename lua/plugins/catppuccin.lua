return { "catppuccin/nvim", name = "catppuccin", priority = 1000,
	config = function() 
		require("catppuccin").setup()
		vim.cmd.colorscheme("catppuccin-frappe") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
	end
}
