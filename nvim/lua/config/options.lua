-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.snacks_animate = false
vim.g.lazyvim_prettier_needs_config = false

vim.opt.list = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.spell = false
vim.opt.spelllang = { "en", "ru" }
vim.opt.termguicolors = true
-- vim.opt.colorcolumn = "120"
vim.diagnostic.config({
	float = {
		border = "rounded",
	},
})

if vim.fn.has("nvim-0.12") == 1 then
	require("vim._core.ui2").enable({})
end

vim.opt.cmdheight = 0
