return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
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
			snacks_win_opts = { position = "right", border = "single", width = 0.5 },
		}
		return opts
	end,
	keys = {
		{ "<leader>as", "<cmd>ClaudeCode<cr>", desc = "Claude toggle" },
	},
}
