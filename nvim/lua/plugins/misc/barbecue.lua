-- -- -- -- -- -- -- -- -- -- -- --
--   plugins/misc/barbecue.lua   --
-- -- -- -- -- -- -- -- -- -- -- --

return {
	"utilyre/barbecue.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("barbecue").setup({
			theme = "auto"
		})
	end
}
