vim.cmd([[set mouse=]])
vim.opt.tabstop = 2
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false

vim.opt.spell = true
vim.opt.spelllang=en_us
vim.opt.spelloptions:append("camel")

vim.api.nvim_set_option("clipboard", "unnamedplus")
