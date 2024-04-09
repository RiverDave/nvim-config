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
      local conf = require "after.plugins.telescope"
      return conf
    end

  },

  --Important, sets current color scheme &
  --configures bg
  -- {
  --   "rose-pine/neovim",
  --   opts = function()
  --     local conf = require "after.plugins.colors"
  --     return conf
  --   end,
  --   name = 'rosepine',
  -- },

  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function ()
      require('after.plugins.colors')
    end
  },

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
   dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"  },
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
      require('ibl').setup()
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
    "github/copilot.vim"
  },

}
