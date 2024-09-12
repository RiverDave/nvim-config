local null_ls = require("null-ls")
local cspell = require("cspell")

local config = {

  filetypes = {
    "markdown",
    "tex",
    "latex",
    "rst",
    "asciidoc",
    "text",
  }
}

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    -- cspell.diagnostics.with({config = config}),
    -- cspell.code_actions.with({config = config}),

  },
})
