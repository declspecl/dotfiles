-- -- -- -- -- -- -- -- -- -- --
-- plugins/misc/which-key.lua --
-- -- -- -- -- -- -- -- -- -- --

return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 0
	end,
    opts = {}
}
