local map = vim.keymap.set
vim.g.mapleader = " "
map('n', '<leader>F', vim.lsp.buf.format)
