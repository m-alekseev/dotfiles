return {
	{
		"folke/which-key.nvim",
		opts = {
			preset = "modern",
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				providers = {
					snippets = {
						enabled = false,
					},
					buffer = {
						enabled = true,
						max_items = 5,
						min_keyword_length = 3,
						opts = {
							get_bufnrs = function()
								return vim.tbl_filter(function(bufnr)
									return vim.bo[bufnr].buftype == ""
								end, vim.api.nvim_list_bufs())
							end,
						},
					},
				},
			},
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
