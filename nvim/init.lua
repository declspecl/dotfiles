-- -- -- -- -- -- -- -- -- -- -- -- --
-- verifying lazy.nvim installation --
-- -- -- -- -- -- -- -- -- -- -- -- --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"

    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()

        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- -- -- -- -- -- -- -- -- --
--   loading user config   --
-- -- -- -- -- -- -- -- -- --
require("config")

-- -- -- -- -- -- -- -- --
--  setting up plugins  --
-- -- -- -- -- -- -- -- --
require("lazy").setup({
    spec = {
        { import = "plugins.colors.rose-pine" },
        { import = "plugins.syntax" },
        { import = "plugins.navi" },
        { import = "plugins.misc" },
        { import = "plugins.lsp" }
    }
})

-- Hyprlang LSP
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.hl", "hypr*.conf"},

    callback = function(event)
        print(string.format("starting hyprls for %s", vim.inspect(event)))

        vim.lsp.start {
            name = "hyprlang",
            cmd = {"hyprls"},
            root_dir = vim.fn.getcwd(),
        }
    end
})
