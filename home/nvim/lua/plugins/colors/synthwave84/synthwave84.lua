-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--  plugins/colors/synthwave84/synthwave84.lua  --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

vim.o.termguicolors = true

return {
	"LunarVim/synthwave84.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd([[colorscheme synthwave84]])
	end
}
