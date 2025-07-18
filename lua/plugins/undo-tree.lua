return {
	"mbbill/undotree",
	config = function()
		vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
		vim.opt.undofile = true
		vim.keymap.set("n", "<leader>u", function()
			vim.cmd("UndotreeToggle")
		end)
	end,
}
