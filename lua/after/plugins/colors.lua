-- Taken from primeagean video
function ColorBg(color, plugin)
  color = color or plugin
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


vim.cmd([[colorscheme modus_vivendi]]) -- modus_operandi, modus_vivendi
-- vim.cmd("colorscheme github_dark_default") -- modus_operandi, modus_vivendi
-- vim.cmd("colorscheme mayu")
-- vim.cmd("colorscheme miasma")
-- vim.cmd("colorscheme rose-pine")




ColorBg(_, "modus_vivendi") 
