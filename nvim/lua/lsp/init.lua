require("lsp.go")
require("lsp.bash")

vim.diagnostic.config({ virtual_text = true })

-- Set up built-in LSP completion
-- This provides basic autocompletion directly from the language server.
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
vim.keymap.set('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  else
    return '<Tab>'
  end
end, { expr = true })
vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  else
    return '<S-Tab>'
  end
end, { expr = true })

vim.lsp.enable({
    'gopls',
    filetypes = { 'go' },
    cmd = { 'gopls' },
    root_markers = { 'go.mod', 'go.work' },
})
vim.lsp.config.bashls = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }
}
vim.lsp.enable({
	'bashls',
	filetypes = { 'bash', 'sh' },
  cmd = { 'bash-language-server', 'start' },
})