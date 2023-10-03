vim.g.barbar_auto_setup = false -- disable auto-setup

require'barbar'.setup() 

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>bn", vim.cmd.BufferNext, opts)
map("n", "<leader>bp", vim.cmd.BufferPrevious, opts)
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>b1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>b2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>b3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>b4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>b5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>b6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>b6', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>b7', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>b8', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>b9', '<Cmd>BufferLast<CR>', opts)
