vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local map = vim.keymap.set

map("n", "<leader>pp", "vi{=")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-h>", "<C-w>h");
map("n", "<C-l>", "<C-w>l");
map("n", "<C-k>", "<C-w>k");
map("n", "<C-j>", "<C-w>j");

map("n", "<leader>sv", ":vsplit<CR>")
map("n", "<leader>sh", ":split<CR>")

map("n", "<A-k>", ":m -2<CR>")
map("n", "<A-j>", ":m +1<CR>")

