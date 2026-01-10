local set = vim.opt
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.textwidth=80
set.expandtab = true
set.shiftwidth=2
set.softtabstop=2
set.tabstop=2
set.number = true
set.relativenumber = true
set.showtabline=1
set.mouse = a 

set.hlsearch = false
set.incsearch = true

set.guicursor = ""
set.termguicolors = true

set.scrolloff = 8
set.signcolumn = "yes"
set.isfname:append("@-@")

set.updatetime = 50
set.colorcolumn = "180"

vim.filetype.add {
  extension = {
    c3 = "c3"
  }
}
vim.treesitter.query.set("c3", "highlights", io.open(vim.fn.stdpath("config").."/queries/highlights.scm", "r"):read("*a"))
