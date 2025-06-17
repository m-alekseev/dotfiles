return {
	{
		"nvim-telescope/telescope.nvim",
		keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
		},
	},
	{
		"folke/which-key.nvim",
		opts = {
			preset = "modern",
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				preset = "super-tab",
				["<C-j>"] = { "select_next" },
				["<C-k>"] = { "select_prev" },
			},
		},
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_z = {},
			},
		},
	},
}
