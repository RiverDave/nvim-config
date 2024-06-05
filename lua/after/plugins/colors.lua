-- Taken from primeagean video
function ColorBg(color, plugin)
  color = color or plugin
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
end

require("no-clown-fiesta").setup({
  transparent = true, -- Enable this to disable the bg color
  styles = {
    -- You can set any of the style values specified for `:h nvim_set_hl`
    comments = { italic = true},
    functions = {},
    keywords = {},
    lsp = { underline = true },
    match_paren = {},
    type = {  },
    variables = { --[[ italic = true ]]},
  },
})

require('github-theme').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
    hide_nc_statusline = true, -- Override the underline style for non-active statuslines
    transparent = false,       -- Disable setting background
    terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,      -- Non focused panes set to alternative background
    module_default = true,     -- Default enable value for modules
    styles = {                 -- Style to be applied to different syntax groups
      -- comments = 'NONE',       -- Value is any valid attr-list value `:help attr-list`
      -- functions = 'NONE',
      -- keywords = 'NONE',
      -- variables = 'NONE',
      -- conditionals = 'NONE',
      -- constants = 'NONE',
      -- numbers = 'NONE',
      -- operators = 'NONE',
      -- strings = 'NONE',
      -- types = 'NONE',
    },
    inverse = {                -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = {                 -- Darken floating windows and sidebar-like windows
      floats = false,
      sidebars = {
        enabled = true,
        list = {},             -- Apply dark background to specific windows
      },
    },
    modules = {                -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})


local curr_scheme = "github_dark_default"

vim.cmd.colorscheme(curr_scheme) -- Or the desired theme
-- ColorBg(_, curr_scheme)
