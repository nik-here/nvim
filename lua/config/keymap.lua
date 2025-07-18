vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- Window Management
vim.keymap.set("n", "<C-\\>", "<C-w>v<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Buffer
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("bp|bd #")
end, { silent = true })
vim.keymap.set("n", "<leader>X", function()
	vim.cmd("bd!")
end, {})
