return {
	{
		"Wansmer/langmapper.nvim",
		lazy = false,
		priority = 1, -- High priority is needed if you will use `autoremap()`
		config = function()
			require("langmapper").setup({--[[ your config ]]
			})
		end,
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
	{
		"terrastruct/d2-vim",
		ft = { "d2" },
	},
}
