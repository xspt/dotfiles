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
   { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
   {
      'kylechui/nvim-surround',
      version = '*',
      event = 'VeryLazy',
      config = true
   },
   {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
   },
   { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
   { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },
   { 'akinsho/bufferline.nvim', version = '*', dependencies = { 'nvim-tree/nvim-web-devicons' } },
   { 'windwp/nvim-ts-autotag', config = true },
   { 'numToStr/Comment.nvim', config = true },
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
   },
   -- LSP
   'neovim/nvim-lspconfig',
   'williamboman/mason.nvim',
   'williamboman/mason-lspconfig.nvim',
   'hrsh7th/nvim-cmp',
   'hrsh7th/cmp-nvim-lsp',
   'L3MON4D3/LuaSnip',
}

require("lazy").setup(plugins, opts)
