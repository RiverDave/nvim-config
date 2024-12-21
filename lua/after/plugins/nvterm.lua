-- bind macro
local map = vim.keymap.set

require("nvterm").setup({
    terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
            float = {
                relative = "editor",
                row = 0.3,
                col = 0.25,
                width = 0.5,
                height = 0.4,
                border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
        },
    },
    behavior = {
        autoclose_on_quit = {
            enabled = false,
            confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
    },
})

-- Bind structure
-- mode, bind , command , Don't forget to call lua!
-- Mx -> alt
-- map( "n", "<A-h>" , "<ESC><cmd> lua require('nvterm.terminal').toggle 'horizontal' <CR>", { noremap = true })
map("n", "<A-i>", "<ESC><cmd> lua require('nvterm.terminal').toggle 'horizontal' <CR>", { noremap = true })
map("n", "<A-v>", "<ESC><cmd> lua require('nvterm.terminal').toggle 'vertical' <CR>", { noremap = true })

-- Escape terminal mode
map("t", "<C-x>", "<C-\\><C-N>")
