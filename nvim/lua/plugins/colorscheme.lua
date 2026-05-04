return {
	{
		"vague-theme/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = false,
				on_highlights = function(hl, colors)
					hl.NormalFloat = { bg = colors.bg }
					hl.WinSeparator = { fg = colors.line } -- thin window separators (WinSeparator)
				end,
			})
			vim.cmd.colorscheme("vague")
		end,
	},
}
