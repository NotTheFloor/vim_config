local lsp_zero = require("lsp-zero")

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp_zero.defaults.cmp_mappings({

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
        {name = 'luasnip'},
	},
	snippet = {
		expand = function(args)
			-- Need Neovim v0.10 for snippet
			-- vim.snippet.expand(args.body)
            luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
	}),
})

--lsp_zero.setup_nvim_cmp({
	--mappings = cmp_mappings
--})

-- lsp_attach is where you enable features that only ork
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
	local opts = {buffer = bufnr}

	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', '<leader>vws', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', '<leader>vrr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'C-h', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set('n', '<leader>vrf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require'lspconfig'.eslint.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.asm_lsp.setup{}
--require'lspconfig'.pyright.setup{}
require'lspconfig'.pyright.setup{
  root_dir = function()
    return vim.fn.getcwd()  -- This sets the root directory to the current working directory in Neovim
  end, 
  cmd = { "env", "NODE_OPTIONS=--max-old-space-size=8192", "pyright-langserver", "--stdio" },
}
require'lspconfig'.rust_analyzer.setup{}

