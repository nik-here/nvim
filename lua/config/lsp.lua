vim.lsp.config("eslint", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"astro",
		"htmlangular",
		"markdown",
		"json",
		"jsonc",
	},
})
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			check = {
				command = "clippy",
			},
		},
	},
})
vim.lsp.config("tailwindcss", {
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "ngClass", "class:list", "variant", "variants" },
			classFunctions = { "cva", "cx" },
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = { globals = { "vim" } },
		},
	},
})
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { desc = "LSP: " .. desc })
		end
		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("<leader>k", vim.diagnostic.open_float, "Open diagnostic float")
	end,
})
