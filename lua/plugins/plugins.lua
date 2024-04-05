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
	    'nvim-telescope/telescope.nvim', tag = '0.1.6',
	      dependencies = { 'nvim-lua/plenary.nvim' },
	      opts = function() -- important, requires our settings as set in target module
		      local conf = require "after.plugins.telescope" 
		      return conf
	      end

	},

	--Important, sets current color scheme &
	--configures bg 
	{
		"rose-pine/neovim", name = "rose-pine" ,
		opts = function() 
			local conf = require "after.plugins.colors"
			return conf

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
	--{
	 --   "ThePrimeagen/harpoon",
	 --   branch = "harpoon2",
	  --  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"  },
	   -- config = function()
	--	    local conf = require('after.plugins.harpoon')
	--	    return conf
	 --   end
	--},

	{
		 "hrsh7th/nvim-cmp",
		 event = "InsertEnter",

	},

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
      }

      
}
