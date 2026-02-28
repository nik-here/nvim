return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		-- Mason must be loaded before its dependents so we need to set it up here.
		-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
		{ "mason-org/mason.nvim", opts = {} },
		{ "mason-org/mason-lspconfig.nvim" },

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
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
			-- Server-specific settings. See `:help lsp-quickstart`
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
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				-- NOTE: Remember that Lua is a real programming language, and as such it is possible
				-- to define small helper and utility functions so you don't have to repeat yourself.
				--
				-- In this case, we create a function that lets us more easily define mappings specific
				-- for LSP related items. It sets the mode, buffer and description for us each time.
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				--  For example, in C this would take you to the header.
				map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("<leader>k", vim.diagnostic.open_float, "Open diagnostic float")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client:supports_method("textDocument/documentHighlight", event.buf) then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = event.buf,
					callback = function()
						vim.lsp.buf.format({ async = false, id = event.data.client_id })
					end,
				})

				-- The following code creates a keymap to toggle inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				if client and client:supports_method("textDocument/inlayHint", event.buf) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"taplo",
				"lua_ls",
				"html",
				"tailwindcss",
				"jsonls",
				"yamlls",
				"markdown_oxide",
			},
			automatic_enable = true,
		})
	end,
}
