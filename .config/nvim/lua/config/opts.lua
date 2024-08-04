-- -- -- -- -- -- -- --
--  config/opts.lua  --
-- -- -- -- -- -- -- --

-- cursor
vim.opt.guicursor = "i:block"

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tab configuration
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- search configuration
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- disable line wrap
vim.opt.wrap = false

vim.opt.hidden = true

-- progress file config
vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.undodir = vim.fn.stdpath("data") .. "/undo/"
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backups/"

-- misc
vim.opt.scrolloff = 10

-- ensuring 0.10 inlay hint visibility is on
vim.g.inlay_hints_visible = true
