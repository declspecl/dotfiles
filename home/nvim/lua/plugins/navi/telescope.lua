-- -- -- -- -- -- -- -- -- -- --
-- plugins/navi/telescope.lua --
-- -- -- -- -- -- -- -- -- -- --

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	init = function()
		local actions = require("telescope.actions")

		require("telescope").setup {
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					}
				},
                file_ignore_patterns = {
                    "node_modules",
                    "target",
                    "build",
                    "dist"
                }
			}
		}
	end
}
