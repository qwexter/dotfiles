vim.pack.add({
	-- theme
  { src = "https://github.com/Shatur/neovim-ayu" },
	-- lsp
  { src = 'https://github.com/neovim/nvim-lspconfig' },
	-- surrounding by a hotkey	
	{ src = "https://github.com/nvim-mini/mini.surround" },
	-- same bahavior with inserting closing brackes etc, as in Intellij
	{ src = "https://github.com/nvim-mini/mini.pairs" },
})


require('mini.pairs').setup()
require('mini.surround').setup()
