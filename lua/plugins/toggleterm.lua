function setTermMapping()
	if vim.fn.has("macunix") == 1 then
		return [[˙]]
	else
		return [[<A-j>]]
	end
end

local term_mapping = setTermMapping()

return {
 "akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
	open_mapping = term_mapping,
	size = 30,
		})
	end
}
