vim.opt.termguicolors = true
require("bufferline").setup{}

local map = vim.keymap.set

map("n", "<leader>bn", vim.cmd.BufferLineCycleNext)
map("n", "<leader>bp", vim.cmd.BufferLineCyclePrev)
map("n", "<leader>bc", vim.cmd.BufferLinePick)
map("n", "<leader>ba", vim.cmd.BufferLineCloseOthers)
