-- -- -- -- -- -- -- -- -- -- -- -- --
-- plugins/colors/miasma/miasma.lua --
-- -- -- -- -- -- -- -- -- -- -- -- --

vim.o.termguicolors = true

return {
	"xero/miasma.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd([[colorscheme miasma]])
	end
}
