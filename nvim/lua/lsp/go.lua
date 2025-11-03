vim.lsp.enable({
    'gopls',
    filetypes = { 'go' },
    cmd = { 'gopls' },
    root_markers = { 'go.mod', 'go.work' },
})

