-- Contains all the colorscheme plugins

-- Taken from primeagean video
-- Makes bg transparent
function ColorBg(color, plugin)
	color = color or plugin
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
end

--local curr_scheme = "github_dark_high_contrast"
--vim.cmd.colorscheme(curr_scheme) -- Or the desired theme
--ColorBg(_, curr_scheme)

return {

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("after.plugins.themes.gruvbox")
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		--   require('after.plugins.colors')
		--   -- vim.cmd('colorscheme github_dark')
		-- end,
	},

	{
		"rebelot/kanagawa.nvim",
	},

	{
		"rose-pine/neovim",
		opts = function()
			-- require "after.plugins.colors"
		end,
		name = "rosepine",
	},

	{
		"miikanissi/modus-themes.nvim",
		-- priority = 1000,
		-- config = function ()
		--   require('after.plugins.colors')
		-- end
	},

	{
		"myypo/borrowed.nvim",
		lazy = false,
		priority = 1000,
		version = "^0", -- Optional: avoid upgrading to breaking versions
	},

	{
		"kdheepak/monochrome.nvim",
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{
		"RRethy/base16-nvim",
	},

	{
		"Mofiqul/vscode.nvim",
	},

	{
		"comfysage/evergarden",
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			transparent_background = false,
			contrast_dark = "hard", -- 'hard'|'medium'|'soft'
			overrides = {}, -- add custom overrides
		},
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	--Tsoding's theme
	{ "blazkowolf/gruber-darker.nvim" },
}
