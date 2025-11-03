vim.lsp.start({
  name = "bashls",
  cmd = { "bash-language-server", "start" },
  root_dir = vim.fs.dirname(vim.fs.find({".git", "bashrc"}, { upward = true })[1]),
  filetypes = { "sh", "bash" },
})
