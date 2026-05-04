return {
	{
		"vague-theme/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = false,
				on_highlights = function(hl, colors)
					hl.NormalFloat = { bg = colors.bg }
					hl.FloatBorder = { fg = colors.line, bg = colors.bg }
					hl.FloatTitle = { fg = colors.keyword, bg = colors.bg, bold = true }
					hl.WinSeparator = { fg = colors.line } -- thin window separators (WinSeparator)

					hl.BlinkCmpMenu = { bg = colors.bg, fg = colors.fg }
					hl.BlinkCmpMenuBorder = { fg = colors.line, bg = colors.bg }
					hl.BlinkCmpMenuSelection = { bg = colors.visual, fg = colors.fg, bold = true }

					hl.BlinkCmpDoc = { bg = colors.bg, fg = colors.fg }
					hl.BlinkCmpDocBorder = { fg = colors.line, bg = colors.bg }
					hl.BlinkCmpSignatureHelp = { bg = colors.bg, fg = colors.fg }
					hl.BlinkCmpSignatureHelpBorder = { fg = colors.line, bg = colors.bg }

					hl.BlinkCmpLabelMatch = { fg = colors.type, bold = true }
					hl.BlinkCmpKind = { fg = colors.func }
				end,
			})
			vim.cmd.colorscheme("vague")
		end,
	},
}
