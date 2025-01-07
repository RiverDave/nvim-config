return {

	-- load colorscheme config
	require("after.plugins.colors"),

	"nvim-lua/plenary.nvim",

	"folke/neodev.nvim",

	{
		"folke/which-key.nvim",
	},

	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function() -- important, requires our settings as set in target module
			require("after.plugins.telescope")
		end,
	},

	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	{ --Mainly syntax highlighting
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			local conf = require("after.plugins.treesitter")
			return conf
		end,
	},

	-- Completions
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter", -- Lazy loading on InsertEnter
		config = function()
			require("after.plugins.completions")
		end,
	},

	{
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"L3MON4D3/LuaSnip",
	},

	{ "rafamadriz/friendly-snippets" },

	{ "saadparwaiz1/cmp_luasnip" },

	{
		"mbbill/undotree",
		config = function()
			local conf = require("after.plugins.undotree")
			return conf
		end,
	},

	{
		"tpope/vim-fugitive",
		config = function()
			local conf = require("after.plugins.fugitive")
			return conf
		end,
	},

	-- Curly brackets/parenthesis thing
	{
		"windwp/nvim-autopairs",
		--TODO: Move these configs outside this file, as I'd look much more organized
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	-- indented scope lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("after.plugins.blankline")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("after.plugins.gitsigns")
		end,
	},

	--WARNING: Repo says this is unmantained
	{
		"zbirenbaum/nvterm",
		config = function()
			require("after.plugins.nvterm")
		end,
	},

	-- Will I use it? I dont know...
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- devicons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("after.plugins.devicons")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("after.plugins.lualine")
		end,
	},

	-- Not sure if the two plugins below this are necessary to be explicitly declared
	-- as dependencies
	{
		"williamboman/mason.nvim",
		config = function()
			require("after.plugins.lsp_config")
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		-- opts = {
		--   ensure_installed = { -- TODO: Add main servers
		--     "eslint@4.8.0",
		--   },
		-- },
	},

	{
		"neovim/nvim-lspconfig",
	},

	-- File formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clangd-format" },
				sh = { "shfmt" },
				js = { "prettier" },
			},
		},
		config = function()
			require("conform").setup(opts)
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"mfussenegger/nvim-dap",

		config = function()
			require("after.plugins.format")
		end,
		dependencies = { "rcarriga/nvim-dap-ui" },
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},

	{
		"github/copilot.vim",
	},

	--None-ls -> non lsp sources support(linters, formatters, etc)
	{
		"nvimtools/none-ls.nvim",
		dependencies = "davidmh/cspell.nvim",
		config = function()
			require("after.plugins.nonels")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			-- debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},

	{
		--TODO: I'll need this to deal with db stuff
		"tpope/vim-dadbod",
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = {
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"vue",
			"xml",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = function()
			return require("after.plugins.nvimtree")
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},

	-- Auto rezisable splits
	{
		"nvim-focus/focus.nvim",
		config = function()
			require("focus").setup()
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"css",
				"javascript",
				"typescriptreact",
				"typescript",
				"javascriptreact",
				"lua",
				html = { mode = "background" },
			}, { mode = "foreground" })
		end,
	},

	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {}, -- your configuration
	},

	--Bookmarks
	{
		"otavioschwanck/arrow.nvim",
		config = function()
			require("after.plugins.arrow")
		end,
	},

	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			require("after.plugins.vimtex")
			vim.g.vimtex_view_method = "zathura"
		end,
	},
}
