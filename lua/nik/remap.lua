local builtin = require('telescope.builtin')
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local widgets = require('dap.ui.widgets')
local dap = require('dap')
local my_sidebar = widgets.sidebar(widgets.scopes)

-- utils
vim.keymap.set("n", ";", ":", { silent = false })
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- Window Management mac
vim.keymap.set("n", "<C-\\>", "<C-w>v")
vim.keymap.set("n", "<C-h>", "<C-w>h");
vim.keymap.set("n", "<C-j>", "<C-w>j");
vim.keymap.set("n", "<C-k>", "<C-w>k");
vim.keymap.set("n", "<C-l>", "<C-w>l");

-- Window Management linux

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
vim.keymap.set('n', '<leader>x', function() vim.cmd("bp|bd #") end, { silent = true })
vim.keymap.set('n', '<leader>X', function() vim.cmd("bd!") end, {})

-- Harpoon mac
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "∑", ui.toggle_quick_menu)
vim.keymap.set("n", "¡", function() ui.nav_file(1) end)
vim.keymap.set("n", "™", function() ui.nav_file(2) end)
vim.keymap.set("n", "£", function() ui.nav_file(3) end)
vim.keymap.set("n", "¢", function() ui.nav_file(4) end)
vim.keymap.set("n", "∞", function() ui.nav_file(5) end)
vim.keymap.set("n", "§", function() ui.nav_file(6) end)
vim.keymap.set("n", "¶", function() ui.nav_file(7) end)
vim.keymap.set("n", "•", function() ui.nav_file(8) end)
vim.keymap.set("n", "ª", function() ui.nav_file(9) end)

-- Harpoon linux
vim.keymap.set("n", "<ALT+w>", ui.toggle_quick_menu)
vim.keymap.set("n", "<ALT+1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<ALT+2>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<ALT+3>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<ALT+4>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<ALT+5>", function() ui.nav_file(5) end)
vim.keymap.set("n", "<ALT+6>", function() ui.nav_file(6) end)
vim.keymap.set("n", "<ALT+7>", function() ui.nav_file(7) end)
vim.keymap.set("n", "<ALT+8>", function() ui.nav_file(8) end)
vim.keymap.set("n", "<ALT+9>", function() ui.nav_file(9) end)

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gps", function() vim.cmd.Git('push') end)
vim.keymap.set("n", "<leader>gpu", function() vim.cmd.Git('pull') end)
vim.keymap.set("n", "<leader>gf", function() vim.cmd.Git('fetch') end)

-- NvimTree
vim.keymap.set("n", "<leader>e", function() vim.cmd("NvimTreeToggle") end)

-- Copy / Paste
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- dap
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
vim.keymap.set("n", "<leader>do", function() dap.step_over() end)
vim.keymap.set("n", "<leader>di", function() dap.step_into() end)
vim.keymap.set("n", "<leader>dt", function() dap.step_out() end)
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end)
vim.keymap.set("n", "<leader>dl", function() dap.run_last() end)
vim.keymap.set("n", "<leader>ds", function()
	my_sidebar.open()
end)
vim.keymap.set("n", "<leader>dh", function()
	widgets.hover()
end)
vim.keymap.set("n", "<leader>dp", function()
	widgets.preview()
end)

-- rust-tools
vim.keymap.set("n", "<leader>rca", function() vim.cmd("RustCodeAction") end)
vim.keymap.set("n", "<leader>rd", function() vim.cmd("RustDebuggables") end)
vim.keymap.set("n", "<leader>rha", function() vim.cmd("RustHoverActions") end)
vim.keymap.set("n", "<leader>rr", function() vim.cmd("RustRunnables") end)

-- undo-tree
vim.keymap.set("n", "<leader>u", function() vim.cmd("UndotreeToggle") end)
