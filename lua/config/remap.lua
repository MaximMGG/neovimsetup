vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local map = vim.keymap.set


map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>t", vim.cmd.TagbarToggle)
map("n", "<leader>ot", vim.cmd.ToggleTerm)


