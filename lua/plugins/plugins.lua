return {
	  "folke/neodev.nvim",

	  "folke/which-key.nvim",

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

	}

}
