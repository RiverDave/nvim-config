-- All packages I warned about in plugins, are used in here.
require("mason").setup()
--require("mason-lspconfig").setup({})

local map = vim.keymap.set
local lspconfig = require("lspconfig")

-- on attach(on buffr) functionalities
local on_attach = function(client, bufnr)
  map("n", "<leader>ra", vim.lsp.buf.rename, {})
  map("n", "<leader>ca", vim.lsp.buf.code_action, {})

  map("n", "gD", vim.lsp.buf.declaration, {})
  map("n", "gd", vim.lsp.buf.definition, {})
  map("n", "gi", vim.lsp.buf.implementation, {})
  -- Lists references within telescope
  map("n", "gr", require("telescope.builtin").lsp_references, {})
  map("n", "K", vim.lsp.buf.hover, {})

  if client.name == "ruff_lsp" then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

-- define default capabilities, capabilities
-- mostly implement completion engines on buffers
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- capabilities.textDocument.foldingRange = {
--   dynamicRegistration = false,
--   lineFoldingOnly = true
-- }

-- specify basic capabilities on these servers...
local servers = {
  "html",
  "cssls",
  "clangd",
  -- "ccls",
  "ts_ls",
  "cmake",
  "bashls",
  "dockerls",
  "mdx_analyzer",
  "gopls",
  "perlnavigator",
  "nil_ls",
  "lua_ls",
  "purescriptls",
  "ocamllsp",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=bundled",
    "--cross-file-rename",
    "--header-insertion=iwyu",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

lspconfig.rust_analyzer.setup(require('after.plugins.rust-analyzer'))
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy"
      },
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
        enable = true
      },
    }
  }
})
lspconfig.eslint.setup(require("after.plugins.eslint"))
lspconfig.pyright.setup(require("after.plugins.pyright"))

-- Golang
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- Auto format & organize imports on save on Go
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

-- Perl lang
require("lspconfig").perlnavigator.setup({
  cmd = { "perlnavigator" },
  settings = {
    perlnavigator = {
      perlPath = "perl",
      enableWarnings = true,
      perltidyProfile = "",
      perlcriticProfile = "",
      perlcriticEnabled = true,
    },
  },
})
