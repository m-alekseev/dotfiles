return {
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters = {
				["markdownlint-cli2"] = function()
					local linter = vim.deepcopy(require("lint.linters.markdownlint-cli2"))
					local config_path = vim.fn.stdpath("config") .. "/.markdownlint.jsonc"
					if vim.uv.fs_stat(config_path) then
						linter.args = { "--config", config_path, "-" }
					end
					return linter
				end,
			},
		},
	},
}
