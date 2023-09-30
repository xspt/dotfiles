-- vim.opt.etc = x
local options = {
   backup = false,
   nu = true,
   relativenumber = true,
   tabstop = 3,
   softtabstop = 3,
   shiftwidth = 3,
   expandtab = true,
   smartindent = true,
   wrap = false,
   hlsearch = false,
   incsearch = true,
   scrolloff = 10,
   sidescrolloff = 10,
   cursorline = true,
   splitbelow = true,
   splitright = true,
   swapfile = false,
   mouse = "",
   termguicolors = true,
}

vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0

for k, v in pairs(options) do
   vim.opt[k] = v
end
