return require("packer").startup({
  function(use)
    use "wbthomason/packer.nvim"

    use {
      "theprimeagen/harpoon",
      requires = { "nvim-lua/plenary.nvim" }
    }

    use {
      "williamboman/mason.nvim",
      config = function() require("mason").setup() end
    }

    use {
      "neovim/nvim-lspconfig",
      config = function() require("ayush.plugins.lsp") end
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      config = function() require("ayush.plugins.treesitter") end,
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    }

    -- snippet engine
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "rafamadriz/friendly-snippets"

    -- autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use { 'hrsh7th/nvim-cmp', config = function() require("ayush.plugins.cmp") end }

    -- nvimtree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = function() require("ayush.plugins.nvimtree") end
    }

    -- whichkey
    use {
      'folke/which-key.nvim',
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- themes
    use {
      "catppuccin/nvim",
      as = "catppuccin",
    }
    use {
      'rebelot/kanagawa.nvim',
    }
    use 'folke/tokyonight.nvim'
    use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }

  end,


  config = {
    display = {
      open_fn = require("packer.util").float,
    }
  }
})
