-- -- -- -- -- -- -- -- -- -- -- -- --
--   plugins/colors/nord/nord.lua   --
-- -- -- -- -- -- -- -- -- -- -- -- --

vim.o.termguicolors = true

return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd([[colorscheme nord]])
	end
}
