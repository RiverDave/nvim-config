-- Taken from primeagean video
function ColorBg(color, plugin)
  color = color or plugin
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
end

-- vim.cmd [[colorscheme tokyonight-moon]]
-- modus_operandi, modus_vivendi
-- vim.cmd("colorscheme github_dark_default")
-- vim.cmd("colorscheme mayu")
-- vim.cmd("colorscheme miasma")
-- vim.cmd("colorscheme rose-pine")

--Comment if needed
-- require("gruvbox").setup({
--   contrast = "hard",
--   palette_overrides = { dark0_hard = "#0E1018" },
--   overrides = {
--     --   -- Comment = {fg = "#626A73", italic = true, bold = true},
--     --   -- #736B62,  #626273, #627273
--     Comment = { fg = "#81878f", italic = true },
--     Define = { link = "GruvboxPurple" },
--     Macro = { link = "GruvboxPurple" },
--     ["@constant.builtin"] = { link = "GruvboxPurple", italic = true },
--     --   ["@storageclass.lifetime"] = { link = "GruvboxAqua" },
--     --   ["@text.note"] = { link = "TODO" },
--     --   ["@namespace.latex"] = { link = "Include" },
--     --   ["@namespace.rust"] = { link = "Include" },
--     --   ContextVt = { fg = "#878788" },
--     --   CopilotSuggestion = { fg = "#878787" },
--     --   CocCodeLens = { fg = "#878787" },
--     --   CocWarningFloat = { fg = "#dfaf87" },
--     --   CocInlayHint = { fg = "#ABB0B6" },
--     --   CocPumShortcut = { fg = "#fe8019" },
--     --   CocPumDetail = { fg = "#fe8019" },
--     --   DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
--     --   -- fold
--     --   Folded = { fg = "#fe8019", bg = "#3c3836", italic = true },
--     --   FoldColumn = { fg = "#fe8019", bg = "#0E1018" },
--     --   SignColumn = { bg = "#fe8019" },
--     --   -- -- new git colors
--     --   DiffAdd = { bold = true, reverse = false, fg = "", bg = "#2a4333" },
--     --   DiffChange = { bold = true, reverse = false, fg = "", bg = "#333841" },
--     --   DiffDelete = { bold = true, reverse = false, fg = "#442d30", bg = "#442d30" },
--     --   DiffText = { bold = true, reverse = false, fg = "", bg = "#213352" },
--     --   -- statusline
--     StatusLine = { bg = "#ffffff", fg = "#0E1018" },
--     StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
--     CursorLineNr = { fg = "#fabd2f", bg = "" },
--     GruvboxOrangeSign = { fg = "#dfaf87", bg = "" },
--     GruvboxAquaSign = { fg = "#8EC07C", bg = "" },
--     GruvboxGreenSign = { fg = "#b8bb26", bg = "" },
--     GruvboxRedSign = { fg = "#fb4934", bg = "" },
--     GruvboxBlueSign = { fg = "#83a598", bg = "" },
--   }
-- })

vim.cmd.colorscheme("gruber-darker") -- Or the desired theme

-- ColorBg(_, "gruvbox")
