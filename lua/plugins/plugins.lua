return {

  "nvim-lua/plenary.nvim",

  "folke/neodev.nvim",


  {
    "folke/which-key.nvim",
  },


  {
    "folke/neoconf.nvim", cmd = "Neoconf"
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function() -- important, requires our settings as set in target module
      require "after.plugins.telescope"
    end

  },

  {
    "rose-pine/neovim",
    opts = function()
      -- require "after.plugins.colors"
    end,
    name = 'rosepine',
  },

  -- {
  --   "folke/tokyonight.nvim",
  --
  --   lazy = false,
  --   priority = 1000,
  --   opts = function()
  --     local conf = require "after.plugins.colors"
  --     return conf
  --   end,
  -- },

  {
    "miikanissi/modus-themes.nvim",
    -- priority = 1000,
    -- config = function ()
    --   require('after.plugins.colors')
    -- end
  },

  {
    "rebelot/kanagawa.nvim",
  },

  {
    "myypo/borrowed.nvim",
    lazy = false,
    priority = 1000,
    version = '^0', -- Optional: avoid upgrading to breaking versions

    -- config = function()
    --   require('after.plugins.colors')
    --   -- vim.cmd("colorscheme mayu")
    --   --
    --   vim.opt.guicursor = "" --override default theme settings
    -- end,
  },

  --Tsoding's theme
  { "blazkowolf/gruber-darker.nvim" },

  {
    'projekt0n/github-nvim-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   require('after.plugins.colors')
    --   -- vim.cmd('colorscheme github_dark')
    -- end,
  },

  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000
  --   ,
  --   config = function()
  --     require('after.plugins.colors')
  --   end,
  -- },

  { --Mainly syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local conf = require("after.plugins.treesitter")
      return conf
    end
  },


  --FIX THIS: problem is prolly caused cause of plenary
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      local conf = require('after.plugins.harpoon')
      return conf
    end
  },

  -- Completions
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Lazy loading on InsertEnter
    config = function()
      require('after.plugins.completions')
    end
  },

  {
    "hrsh7th/cmp-nvim-lsp",
  },

  {
    "L3MON4D3/LuaSnip"
  },
  ----

  {
    "mbbill/undotree",
    config = function()
      local conf = require("after.plugins.undotree")
      return conf
    end
  },


  {
    "tpope/vim-fugitive",
    config = function()
      local conf = require("after.plugins.fugitive")
      return conf
    end
  },

  -- Curly brackets/parenthesis thing
  {
    "windwp/nvim-autopairs",
    --TODO: Move these configs outside this file, as I'd look much more organized
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  -- indented scope lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("after.plugins.blankline")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('after.plugins.gitsigns')
    end,
  },

  --WARNING: Repo says this is unmantained
  {
    "zbirenbaum/nvterm",
    config = function()
      require("after.plugins.nvterm")
    end,
  },

  -- Will I use it? I dont know...
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  -- devicons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require('after.plugins.devicons')
    end,

  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('after.plugins.lualine')
    end
  },

  -- Not sure if the two plugins below this are necessary to be explicitly declared
  -- as dependencies
  {
    "williamboman/mason.nvim",
    config = function()
      require('after.plugins.lsp_config')
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- opts = {
    --   ensure_installed = { -- TODO: Add main servers
    --     "eslint@4.8.0",
    --   },
    -- },
  },

  {
    "neovim/nvim-lspconfig",
  },

  -- File formatting
  {
    "stevearc/conform.nvim",
    -- Specify formatters below (Might modularize this thing...)
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        cpp = { "clangd-format" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end
  },

  -- Scope folding, CONFIG THIS LATER
  -- {
  --
  --   'kevinhwang91/nvim-ufo',
  --   dependencies = { 'kevinhwang91/promise-async' },
  --   config = function ()
  --     require('lua.after.plugins.ufo')
  --   end
  --
  --
  -- }

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },

  {
    "mfussenegger/nvim-dap",

    config = function()
      require('after.plugins.dap')
    end,
    dependencies = { 'rcarriga/nvim-dap-ui' },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  {
    "github/copilot.vim"
  },

  --None-ls -> non lsp sources support(linters, formatters, etc)
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require('after.plugins.nonels')
    end,
    requires = { "nvim-lua/plenary.nvim" },

  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },    -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      -- debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  {
    --TODO: I'll need this to deal with mysql stuff
    "tpope/vim-dadbod",
  },

  --Pretty UI:
  --
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },

    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
  },

  {
    "mellow-theme/mellow.nvim"
  },

  -- { 'jaredgorski/spacecamp' },

  { 'doums/darcula' },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    'comfysage/evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      transparent_background = false,
      contrast_dark = 'hard', -- 'hard'|'medium'|'soft'
      overrides = {},         -- add custom overrides
    }
  },

  -- {
  --   'mvllow/modes.nvim',
  --   tag = 'v0.2.0',
  --   config = function()
  --     require('modes').setup()
  --   end
  -- },

  -- Some funny themes:
  {

    "rafi/awesome-vim-colorschemes",
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end,

  },


  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
      "vue",
      "xml",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }

}
