return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			custom_highlights = function(colors)
				local highlights = {}
				local spell_options = { style = { "underline" }, bg = colors.red, fg = colors.base }
				local spell_groups = { "SpellBad", "SpellCap", "SpellLocal", "SpellRare" }
				for _, v in ipairs(spell_groups) do
					highlights[v] = spell_options
				end

				return highlights
			end,
		})
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
