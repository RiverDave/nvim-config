local opt = vim.opt
local o = vim.o

opt.termguicolors = true

--Colorscheme stuff (Should be somewhere else tbh)


-- opt.guicursor = ""
-- opt.guicursor = "n-v-i-c:block-Cursor"
-- opt.guicursor = "n-v-i-c:block-Cursor/lCursor-blinkon0,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor" -- line cursor

o.clipboard = "unnamedplus" -- Clipboard support, yay!

o.cursorline = true

o.cursorlineopt = "number"
o.relativenumber = true

-- opt.nohlsearch = false
o.ignorecase = true
o.smartcase = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Status line

--Screen wide status line
vim.o.laststatus = 3

--Filetypes
vim.filetype.add({ extension = { purs = "purescript" } })
--  Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- misc
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
o.linespace = 8  -- Set the line spacing to 4 pixels

opt.list = true
-- opt.listchars = { eol = '↴'}

--Neovide (gui) opts

if vim.g.neovide then
	vim.g.neovide_input_macos_option_key_is_meta = "only_left"
	-- vim.g.guifont = "SauceCodePro Nerd Font Mono:h14"
	vim.o.guifont = "Source Code Pro:h22" -- text below applies for VimScript
end
