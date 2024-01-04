local M = {}

local merge_tb = vim.tbl_deep_extend

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = { "html", "cssls", "tsserver", "clangd", "gopls","pyright", }

for _, lsp in ipairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	local exists, settings = pcall(require, "custom.configs.lsp.server-settings." .. lsp)
	if exists then
		opts = merge_tb("force", settings, opts)
	end

	lspconfig[lsp].setup(opts)
end

-- rust lsp config
require'lspconfig'.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust"},
  root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    cargo = {
      allFeatures = true,
      autoreload = true,
    },
  }
})

local config = {
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = "always",
	},
}

vim.diagnostic.config(config)

return M
