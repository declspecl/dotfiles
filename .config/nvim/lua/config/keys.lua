-- -- -- -- -- -- -- --
--  config/keys.lua  --
-- -- -- -- -- -- -- --

-- -- -- -- -- -- -- -- --
--   leader key setup   --
-- -- -- -- -- -- -- -- --
vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { remap = false, silent = true, desc = "Leader key"})

-- -- -- -- -- -- -- -- -- -- -- --
--   file navigation shortcuts   --
-- -- -- -- -- -- -- -- -- -- -- --
vim.keymap.set("n", "<C-u>", "<C-u>zz",         { remap = false, silent = true, desc = "Scroll up and center view on cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz",         { remap = false, silent = true, desc = "Scroll down and center view on cursor" })
vim.keymap.set("n", "<C-e>", "<Cmd>Oil<CR>",    { remap = false, silent = true, desc = "Open Oil at the cwd" })

-- -- -- -- -- -- -- -- --
--  telescope keybinds  --
-- -- -- -- -- -- -- -- --
vim.keymap.set("n", "<leader>ff",   "<Cmd>Telescope find_files<CR>",    { remap = false, silent = true, desc = "Open Telescope file search" })
vim.keymap.set("n", "<C-f>",        "<Cmd>Telescope find_files<CR>",    { remap = false, silent = true, desc = "Open Telescope file search" })
vim.keymap.set("n", "<leader>fg",   "<Cmd>Telescope live_grep<CR>",    { remap = false, silent = true, desc = "Open Telescope live grep" })
vim.keymap.set("n", "<leader>fb",   "<Cmd>Telescope buffers<CR>",      { remap = false, silent = true, desc = "Open Telescope buffer search" })
vim.keymap.set("n", "<leader>fh",   "<Cmd>Telescope help_tags<CR>",    { remap = false, silent = true, desc = "Open Telescope help tags" })

-- -- -- -- -- -- -- -- --
--   harpoon keybinds   -- 
-- -- -- -- -- -- -- -- --
local wait_1ms = "<Cmd>sleep 1m<CR>"

local harpoon_nav_string = function(slot_num)
    return "<Cmd>lua require('harpoon.ui').nav_file(" .. slot_num .. ")<CR>"
end

vim.keymap.set("n", "<leader>hh", "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",     { remap = false, desc = "Toggle harpoon menu" })
vim.keymap.set("n", "<leader>ha", "<Cmd>lua require('harpoon.mark').add_file()<CR>",            { remap = false, desc = "Add harpoon mark" })

vim.keymap.set("n", "<leader>1", harpoon_nav_string(1) .. wait_1ms .. "zz", { remap = false, desc = "Go to harpoon mark 1" })
vim.keymap.set("n", "<leader>2", harpoon_nav_string(2) .. wait_1ms .. "zz", { remap = false, desc = "Go to harpoon mark 2" })
vim.keymap.set("n", "<leader>3", harpoon_nav_string(3) .. wait_1ms .. "zz", { remap = false, desc = "Go to harpoon mark 3" })
vim.keymap.set("n", "<leader>4", harpoon_nav_string(4) .. wait_1ms .. "zz", { remap = false, desc = "Go to harpoon mark 4" })
vim.keymap.set("n", "<leader>5", harpoon_nav_string(5) .. wait_1ms .. "zz", { remap = false, desc = "Go to harpoon mark 5" })
vim.keymap.set("n", "<leader>6", harpoon_nav_string(6) .. wait_1ms .. "zz", { remap = false, desc = "Go to harpoon mark 6" })

-- -- -- -- -- -- -- -- --
--   trouble keybinds   --
-- -- -- -- -- -- -- -- --
vim.keymap.set("n", "<leader>tr", "<Cmd>Trouble<CR>", { remap = false, silent = true, desc = "Open Trouble" })

-- -- -- -- -- -- -- -- -- --
--   ToggleTerm keybinds   --
-- -- -- -- -- -- -- -- -- --
vim.keymap.set("n", "<leader>tt", "<Cmd>ToggleTerm direction=float<CR>", { remap = false, silent = true, desc = "Open ToggleTerm in a floating window" })

-- -- -- -- -- -- -- -- -- -- --
-- window navigation keybinds --
-- -- -- -- -- -- -- -- -- -- --

-- window splitting
vim.keymap.set("n", "<leader>vv", "<Cmd>vsplit<CR>",    { remap = false, silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<leader>vh", "<Cmd>split<CR>",     { remap = false, silent = true, desc = "Split window vertically" })

-- wincmd keybinds
vim.keymap.set("n", "<A-h>", "<Cmd>wincmd h<CR>", { remap = false, silent = true, desc = "Focus left window" })
vim.keymap.set("n", "<A-j>", "<Cmd>wincmd j<CR>", { remap = false, silent = true, desc = "Focus down window" })
vim.keymap.set("n", "<A-k>", "<Cmd>wincmd k<CR>", { remap = false, silent = true, desc = "Focus top window" })
vim.keymap.set("n", "<A-l>", "<Cmd>wincmd l<CR>", { remap = false, silent = true, desc = "Focus right window" })

-- winshift keybinds
vim.keymap.set("n", "<leader>ww", "<Cmd>WinShift<CR>",      { remap = false, desc = "Open Winshift" })
vim.keymap.set("n", "<leader>ws", "<Cmd>WinShift swap<CR>", { remap = false, desc = "Winshift swap windows" })
