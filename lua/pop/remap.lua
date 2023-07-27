vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

vim.keymap.set('n', '<leader>da', ':lua attach_to_debug()<CR>')

vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<F8>', ':lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<F7>', ':lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<F6>', ':lua require"dap".step_out()<CR>')

vim.keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpiont(vim.fn.input("Condition: "))<CR>')
vim.keymap.set('n', '<leader>bl', ':lua require"dap".set_breakpiont(nil, nil, vim.fn.input("Log: "))<CR>')
vim.keymap.set('n', '<leader>dl', ':lua require"dap".repl.open()<CR>')

