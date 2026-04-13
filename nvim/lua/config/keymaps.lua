-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>ux", function()
	vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↵" }
	vim.cmd("set list!")
end, { desc = "Toggle Hidden Characters" })
