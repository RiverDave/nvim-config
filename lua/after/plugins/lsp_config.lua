-- All packages I warned about in plugins, are used in here.
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" }
})

local map = vim.keymap.set
local lspconfig = require('lspconfig')

-- on attach(on buffr) functionalities
local on_attach = function(_, _)
  map('n', '<leader>ra', vim.lsp.buf.rename, {})
  map('n', '<leader>ca', vim.lsp.buf.code_action, {})

  map('n', 'gD', vim.lsp.buf.declaration, {})
  map('n', 'gd', vim.lsp.buf.definition, {})
  map('n', 'gi', vim.lsp.buf.implementation, {})
  -- Lists references within telescope
  map('n', 'gr', require('telescope.builtin').lsp_references, {})
  map('n', 'K', vim.lsp.buf.hover, {})
end

-- define default capabilities, capabilities
-- mostly implement completion engines on buffers
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- capabilities.textDocument.foldingRange = {
--   dynamicRegistration = false,
--   lineFoldingOnly = true
-- }



-- specify default config on these servers...
local servers = { "html", "cssls", "clangd", "tailwindcss", "tsserver","cmake", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.rust_analyzer.setup {
  -- on_attach = function(client, bufnr)
  --   on_attach.on_attach(client, bufnr)               -- Call the general on_attach function
  --   on_attach.setup_rust_analyzer(client, bufnr)     -- Call the Rust Analyzer setup function
  -- end,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  flags = { debounce_text_changes = 500 },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    if client.server_capabilities.documentFormattingProvider then
      local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format { async = true }
        end,
        group = au_lsp,
      })
    end
  end,
}
