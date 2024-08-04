-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--   plugins/colors/tokyonight/tokyonight.lua   --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

vim.o.termguicolors = true

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd([[colorscheme tokyonight-night]])
	end
}
