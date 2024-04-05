local map = vim.keymap.set

require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end,
})

-- Fold related binds
map('n', 'zR', require('ufo').openAllFolds)
map('n', 'zM', require('ufo').closeAllFolds)

-- local M = {
--  none = '2323',
-- }
