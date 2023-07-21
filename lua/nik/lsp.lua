local lsp = require('lsp-zero').preset({})
require('mason').setup()
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.preset({
	capabilities = lsp_capabilities,
	configure_diagnostics = true,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end, opts)
	lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
end)

lsp.setup()
