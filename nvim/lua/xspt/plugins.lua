local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
   PACKER_BOOTSTRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
   }
   print "Installing packer close and reopen Neovim..."
   vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
   augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
   return
end

-- Have packer use a popup window
packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "rounded" }
      end,
   },
}

-- Install your plugins here
return packer.startup(function(use)
   -- My plugins here
   use "wbthomason/packer.nvim"
   use "nvim-lua/popup.nvim"
   use "nvim-lua/plenary.nvim"
   use { "catppuccin/nvim", as = "catppuccin" }
   use ({
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
         require("nvim-surround").setup({})
      end
   })
   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
   }
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
   }
   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
         -- LSP Support
         {'neovim/nvim-lspconfig'},             -- Required
         {'williamboman/mason.nvim'},           -- Optional
         {'williamboman/mason-lspconfig.nvim'}, -- Optional

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},     -- Required
         {'hrsh7th/cmp-nvim-lsp'}, -- Required
         {'L3MON4D3/LuaSnip'},     -- Required
      }
   }
   use {
      'nvim-tree/nvim-tree.lua',
      requires = {
         'nvim-tree/nvim-web-devicons', -- optional
      },
   }
   use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
   use ({
      'windwp/nvim-ts-autotag',
      config = function()
         require("nvim-ts-autotag").setup()
      end
   })
   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if PACKER_BOOTSTRAP then
      require("packer").sync()
   end
end)
