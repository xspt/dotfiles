local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')

lsp.on_attach(function(client, bufnr)
   -- see :help lsp-zero-keybindings
   -- to learn the available actions
   lsp.default_keymaps({buffer = bufnr})
end)

cmp.setup({
   mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({select = false}),
      ['<Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         else
            fallback()
         end
      end),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         else
            fallback()
         end
      end)
   })
})

--[[
require('mason').setup({})
require('mason-lspconfig').setup({
   ensure_installed = {},
   handlers = {
      lsp_zero.default_setup,
   }
})
]]--

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
