require("conform").setup({

	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clangd-format" },
		sh = { "shfmt" },
		js = { "prettier" },
		nix = { "nixfmt" },
	},

	-- formatters = {
	--   stylua = {
	--     command = "stylua",
	--     args = {"--indent-type", "Spaces", "$FILENAME"}
	--   },
	--
	--
	-- },
})
