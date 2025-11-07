vim.lsp.enable({
	'bashls',
	filetypes = { 'bash', 'sh' },
  cmd = { 'bash-language-server', 'start' },
})
