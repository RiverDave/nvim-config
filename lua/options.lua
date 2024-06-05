local opt = vim.opt
local o = vim.o



opt.guicursor = ""

o.clipboard = "unnamedplus"  -- Clipboard support, yay!

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


opt.list = true
-- opt.listchars = { eol = '↴'}

