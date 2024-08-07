-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- plugins/colors/rose-pine/rose-pine.lua --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	init = function()
		require("rose-pine").setup {
			-- variant = "moon",
			disable_italics = true
		}

		vim.cmd([[colorscheme rose-pine]])
        vim.cmd([[hi StatusLineNC blend=0]])
	end
}
