require("lspconfig")

vim.lsp.config('ty', {
	cmd = { 'ty', 'server'},
	filetypes = { 'pythong', 'py'},
	root_dir = vim.fs.root(0, {'pyproject.toml', '.git'}),
	settings = {
		ty = {
			inlayHints = { variableTypes = true},
		},
	},
})
vim.lsp.enable('ty')

vim.lsp.config('ruff', {
	init_options = {
		settings = {
			configurationPreference = "filesystemFirst",
		},
	},
})
vim.lsp.enable('ruff')
