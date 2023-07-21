local builtin = require('telescope.builtin')
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- Window Management
vim.keymap.set("n", "æ", "<C-w>v")
vim.keymap.set("n", "<C-h>", "<C-w>h");
vim.keymap.set("n", "<C-j>", "<C-w>j");
vim.keymap.set("n", "<C-k>", "<C-w>k");
vim.keymap.set("n", "<C-l>", "<C-w>l");

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', function()
	vim.cmd("Telescope find_files follow=true no_ignore=true hidden=true")
end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', function()
	vim.cmd("Telescope harpoon marks")
end, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- Buffer
vim.keymap.set('n', '<leader>x', function() vim.cmd("bd") end, {})

-- Harpoon
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "∑", ui.toggle_quick_menu)
vim.keymap.set("n", "¡", function() ui.nav_file(1) end)
vim.keymap.set("n", "™", function() ui.nav_file(2) end)
vim.keymap.set("n", "£", function() ui.nav_file(3) end)
vim.keymap.set("n", "¢", function() ui.nav_file(4) end)

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gps", function() vim.cmd.Git('push') end)
vim.keymap.set("n", "<leader>gpu", function() vim.cmd.Git('pull') end)
vim.keymap.set("n", "<leader>gf", function() vim.cmd.Git('fetch') end)

-- NvimTree
vim.keymap.set("n", "<leader>e", function() vim.cmd("NvimTreeToggle") end)

-- Copy / Paste
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
