-- All packages I warned about in plugins, are used in here.
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls"}
})

local map = vim.keymap.set

-- on attach(on buffr) functionalities
local on_attach = function(_, _)
  map('n', '<leader>ra', vim.lsp.buf.rename, {})
  map('n', '<leader>ca', vim.lsp.buf.code_action, {})

  map('n', 'gD', vim.lsp.buf.declaration, {})
  map('n', 'gd', vim.lsp.buf.definition, {})
  map('n', 'gi', vim.lsp.buf.implementation, {})
  map('n', 'gr', require('telescope.builtin').lsp_references, {})
  map('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()



require("lspconfig").lua_ls.setup{
  -- granting specified lsp buffr -> on_attach capabilities
  on_attach = on_attach,
  capabilities = capabilities
}

