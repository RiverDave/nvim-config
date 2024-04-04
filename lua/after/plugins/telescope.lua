local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', builtin.find_files, {}) -- find all
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {}) -- grep current file(s)
vim.keymap.set('n', '<leader>fg', builtin.git_files, {}) -- find git files only
vim.keymap.set('n', '<leader>fp',  function()  --lists files with specified string -> Project wide
	builtin.grep_string({search = vim.fn.input("Grep > ")})
end)
