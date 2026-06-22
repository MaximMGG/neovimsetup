return require('packer').startup(function(use)
--   Packer can manage itself
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

  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    --tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
  use {
        'nvim-telescope/telescope.nvim', tag = '*',
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
  use "RRethy/base16-nvim"
  use ({
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
       })
  use "ray-x/lsp_signature.nvim"
  use "folke/flash.nvim"
  use "mg979/vim-visual-multi"
end)
