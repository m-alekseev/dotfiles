return {
	{
		-- need it to python's venv to work, lol
		"nvim-telescope/telescope.nvim",
		keys = {
			-- add a keymap to browse plugin files
			-- stylua:ignore
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
				end,
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
				-- preset = "super-tab",
				["C-space"] = { "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_z = {},
			},
		},
	},
}
