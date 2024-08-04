-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- plugins/colors/oxocarbon/oxocarbon.lua --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --

vim.o.termguicolors = true

return {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd([[colorscheme oxocarbon]])
	end
}
