return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = function(_, opts)
		require("claudecode").setup(opts)
		vim.api.nvim_create_autocmd("WinEnter", {
			callback = function()
				local buf = vim.api.nvim_get_current_buf()
				local chan = vim.bo[buf].channel
				if chan ~= 0 and vim.api.nvim_buf_get_name(buf):find("claude", 1, true) then
					vim.api.nvim_chan_send(chan, "\x0c")
					vim.wo.winfixwidth = true
				end
			end,
		})
	end,
	cmd = {
		"ClaudeCode",
		"ClaudeCodeFocus",
		"ClaudeCodeSelectModel",
		"ClaudeCodeAdd",
		"ClaudeCodeSend",
		"ClaudeCodeTreeAdd",
		"ClaudeCodeStatus",
		"ClaudeCodeStart",
		"ClaudeCodeStop",
		"ClaudeCodeOpen",
		"ClaudeCodeClose",
		"ClaudeCodeDiffAccept",
		"ClaudeCodeDiffDeny",
		"ClaudeCodeCloseAllDiffs",
	},
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<M-c>", "<cmd>ClaudeCode<cr>", mode = { "n", "i", "t", "v" }, desc = "Toggle Claude" },
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
		},
		-- Diff management
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
	opts = function(_, opts)
		local env_file = vim.fn.stdpath("config") .. "/lua/plugins/.env"
		local env_vars = {}

		if vim.fn.filereadable(env_file) == 1 then
			for line in io.lines(env_file) do
				local key, val = line:match("^%s*([%w_]+)%s*=%s*(.+)$")
				if key then
					env_vars[key] = val
				end
			end
		end

		opts.env = {
			HTTPS_PROXY = env_vars.HTTPS_PROXY,
			HTTP_PROXY = env_vars.HTTP_PROXY,
			ALL_PROXY = env_vars.ALL_PROXY,
		}
		opts.terminal_cmd = "claude"
		opts.terminal = {
			provider = "snacks",
			snacks_win_opts = {
				-- position = "float",
				position = "right",
				border = "single",
				width = 0.4,
				-- width = 0.9,
				-- height = 0.9,
				keys = {
					normal_mode = {
						"<M-n>",
						function()
							vim.api.nvim_feedkeys(
								vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true),
								"t",
								false
							)
						end,
						mode = "t",
						desc = "Normal mode",
					},
				},
			},
		}
		opts.diff_opts = {
			open_in_new_tab = true,
			auto_resize_terminal = false,
			hide_terminal_in_new_tab = true,
		}
		return opts
	end,
}
