vim.cmd.colorscheme("catppuccin-frappe") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.opt.scrolloff = 10
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.g.have_nerd_font = true
vim.o.mouse = "a"
vim.o.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true

vim.lsp.enable("gdscript")
