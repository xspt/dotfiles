local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
   'nvim-lua/popup.nvim',
   'nvim-lua/plenary.nvim',
   { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
   {
      'kylechui/nvim-surround',
      version = '*',
      event = 'VeryLazy'
   },
   {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
   },
   { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
   {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
         {'neovim/nvim-lspconfig'},             -- Required
         {'williamboman/mason.nvim'},           -- Optional
         {'williamboman/mason-lspconfig.nvim'}, -- Optional
         {'hrsh7th/nvim-cmp'},     -- Required
         {'hrsh7th/cmp-nvim-lsp'}, -- Required
         {'L3MON4D3/LuaSnip'},     -- Required
      }
   },
   { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },
   { 'akinsho/bufferline.nvim', version = '*', dependencies = { 'nvim-tree/nvim-web-devicons' } },
   { 'windwp/nvim-ts-autotag', config = true },
   { 'numToStr/Comment.nvim', config = true }
}

require("lazy").setup(plugins, opts)
