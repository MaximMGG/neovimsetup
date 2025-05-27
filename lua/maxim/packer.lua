vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        "williamboman/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {'nvim-tree/nvim-tree.lua', 'nvim-tree/nvim-web-devicons' }
    use {'m4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup()
        end
    }
    use 'lewis6991/gitsigns.nvim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'romgrk/barbar.nvim'
    use "RRethy/base16-nvim"
end)
