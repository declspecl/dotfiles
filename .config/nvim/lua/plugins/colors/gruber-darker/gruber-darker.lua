-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--   plugins/colors/gruber-darker/gruber-darker.lua   --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

vim.o.termguicolors = true

return {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd[[colorscheme gruber-darker]]
    end
}
