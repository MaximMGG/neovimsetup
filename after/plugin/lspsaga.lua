require('lspsaga').setup({
    lightbulb = {
        enable = false,
    }
})

local saga = require('lspsaga')


vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
