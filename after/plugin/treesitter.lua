require('nvim-treesitter').install {'c', 'odin', 'cpp', 'nim', 'c3'}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'nim',
  callback = function()
    vim.treesitter.start()
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c3',
  callback = function()
    vim.treesitter.start()
  end
})
