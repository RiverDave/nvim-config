local map = vim.keymap.set
-- Insert personal keymaps in here!
vim.g.mapleader = " " -- leader -> space key

-- preview mode: Ex
map("n", "<leader>pv", vim.cmd.Ex)


-- General shorcuts
map("n", "<C-s>", vim.cmd.w)      -- save shrct
map("n", "<C-c>", "<cmd>%y+<CR>") -- copy select & copy whole file
map("n", "<C-x>", "<cmd>q<CR>")   -- quit file
map("n", "<C-x>s", "<cmd>wq<CR>") -- save and quit file



map("n", "<C-c>", "<cmd>%y+<CR>") -- copy select & copy whole file

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })

map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

-- TODO: Configure WhickKey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Whichkey query lookup" })


--File format:

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end)

-- Some lsp stuff (see lsp_config for buffr specifics)

map("n", "<leader>lf", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

-- Toggleable term thanks to nvchad
-- FIXME: This is not being toggled
map({ "n", "t" }, "<A-v>", function()
  require("after.plugins.nvterm").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
end)

-- NOTE: Causes conflict with yabai
-- map({ "n", "t" }, "<A-h>", function()
--   require("after.plugins.nvterm").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
-- end)

map({ "n", "t" }, "<A-i>", function()
  require("after.plugins.nvterm").toggle { pos = "float", id = "floatTerm" }
end)

-- Copilot setup 

map('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
