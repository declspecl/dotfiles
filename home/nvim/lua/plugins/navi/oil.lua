-- -- -- -- -- -- -- -- --
-- plugins/navi/oil.lua --
-- -- -- -- -- -- -- -- --

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup {
            default_file_explorer = true,

			columns = {
				"icon",
				"size"
			},
			keymaps = {
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["<BS>"] = "actions.parent",
				["-"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["g?"] = "actions.show_help",
				["g."] = "actions.toggle_hidden"
			},
			view_options = {
				show_hidden = true
			}
		}
	end
}
