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
map("v", "<leader>cy", "\"+yy")

map("n", "<leader>rr", "<cmd>RustRun<CR>")
map("n", "<leader>rt", "<cmd>RustTest<CR>")

-- map("n", "<leader>oc", vim.cmd.find("/home/maxim/.config/nvim/lua/maxim/init.lua"))

local open_config = function()
  vim.cmd.find("/home/maxim/.config/nvim/lua/maxim/init.lua")
end

map("n", "<leader>oc", open_config)

local open_terminal = function()
  vim.cmd.vsplit()
  vim.cmd.terminal()
end

map("n", "<leader>ot", open_terminal)

