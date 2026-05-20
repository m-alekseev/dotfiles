return {
	-- To disable semanticTokensProvider which makes colors dimmer after a few seconds after opening a buffer
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = {
	-- 		setup = {
	-- 			["*"] = function(_, opts)
	-- 				local on_attach = opts.on_attach
	-- 				opts.on_attach = function(client, bufr)
	-- 					if on_attach then
	-- 						on_attach(client, bufr)
	-- 					end
	-- 					client.server_capabilities.semanticTokensProvider = nil
	-- 				end
	-- 			end,
	-- 		},
	-- 	},
	-- },
	{
		"folke/snacks.nvim",
		opts = {
			indent = {
				enabled = false, -- disable indent lines by default
			},
			terminal = {
				win = {
					keys = {
						clear_terminal = {
							"<M-l>",
							function()
								vim.api.nvim_chan_send(vim.bo.channel, "\x0c")
							end,
							mode = "t",
							desc = "Clear",
						},
					},
				},
			},
			-- explorer = {
			-- 	enabled = false,
			-- },
		},
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = false,
			view_options = {
				show_hidden = true,
			},
			-- keymaps = {
			-- 	["q"] = "actions.close",
			-- },
		},
		keys = {
			{
				"<leader>-",
				function()
					require("oil").open()
				end,
				desc = "Open Oil explorer",
			},
			-- {
			-- 	"<leader>e",
			-- 	function()
			-- 		require("oil").open()
			-- 	end,
			-- 	desc = "open oil explorer",
			-- },
		},
		-- Optional dependencies
		-- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
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
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
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
		-- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = { theme = "vague" },
			sections = {
				lualine_z = {},
			},
		},
	},
	{
		"terrastruct/d2-vim",
		ft = { "d2" },
	},
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				enabled = false,
			},
		},
	},
}
