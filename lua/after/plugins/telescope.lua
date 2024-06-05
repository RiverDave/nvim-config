local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', builtin.find_files, {}) -- find all
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {}) -- grep current file(s)
vim.keymap.set('n', '<leader>fg', builtin.git_files, {}) -- find git files only
vim.keymap.set('n', '<leader>fp',  function()  --lists files with specified string -> Project wide
	builtin.grep_string({search = vim.fn.input("Grep > ")})
end)

vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- List opened buffers
vim.keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>") -- Fuzzy find in current buffer

-- List commits
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>")

-- List TODOS , Project - wide
vim.keymap.set("n", "<leader>fx", "<cmd>TodoTelescope<CR>")

require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}


