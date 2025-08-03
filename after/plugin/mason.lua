require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = false
})
require("mason-nvim-dap").setup({
    ensure_installed = {"cppdbg"},
    automatic_installation = true,
    handlers = {
        function(config)
            require("mason-nvim-dap").default_setup(config)
        end,
    },
})
