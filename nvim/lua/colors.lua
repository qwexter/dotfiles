require('ayu').setup({
  mirage = true,
  terminal = true,
})
vim.cmd("colorscheme ayu")
vim.cmd(":hi statusline guibg=NONE")
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })

