-- Taken from primeagean video
function ColorBg(color, plugin)
  color = color or plugin
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
end

-- require('github-theme').setup({
--   options = {
--     -- Compiled file's destination location
--     compile_path = vim.fn.stdpath('cache') .. '/github-theme',
--     compile_file_suffix = '_compiled', -- Compiled file suffix
--     hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
--     hide_nc_statusline = true, -- Override the underline style for non-active statuslines
--     transparent = false,       -- Disable setting background
--     terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     dim_inactive = false,      -- Non focused panes set to alternative background
--     module_default = true,     -- Default enable value for modules
--     styles = {                 -- Style to be applied to different syntax groups
--       -- comments = 'NONE',       -- Value is any valid attr-list value `:help attr-list`
--       -- functions = 'NONE',
--       -- keywords = 'NONE',
--       -- variables = 'NONE',
--       -- conditionals = 'NONE',
--       -- constants = 'NONE',
--       -- numbers = 'NONE',
--       -- operators = 'NONE',
--       -- strings = 'NONE',
--       -- types = 'NONE',
--     },
--     inverse = {                -- Inverse highlight for different types
--       match_paren = false,
--       visual = false,
--       search = false,
--     },
--     darken = {                 -- Darken floating windows and sidebar-like windows
--       floats = false,
--       sidebars = {
--         enabled = true,
--         list = {},             -- Apply dark background to specific windows
--       },
--     },
--     modules = {                -- List of various plugins and additional options
--       -- ...
--     },
--   },
--   palettes = {},
--   specs = {},
--   groups = {},
-- })

-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
-- vim.cmd("colorscheme gruvbox")


local curr_scheme = "gruvbox"

vim.cmd.colorscheme(curr_scheme) -- Or the desired theme
-- ColorBg(_, curr_scheme)
