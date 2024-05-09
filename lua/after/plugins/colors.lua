-- Taken from primeagean video
function ColorBg(color, plugin)
  color = color or plugin
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
end

vim.cmd.colorscheme("rose-pine") -- Or the desired theme
ColorBg(_, "rose-pine")
