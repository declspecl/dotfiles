-- -- -- -- -- -- -- -- -- -- --
--  plugins/misc/neovide.lua  --
-- -- -- -- -- -- -- -- -- -- --

if vim.g.neovide then
    local header

    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0

    vim.keymap.set("n", "<leader>ft", "<Cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>", { silent = true, remap = false, desc = "Toggles neovide being fullscreen" })

    if os.getenv("IS_LAPTOP") then
        vim.o.guifont = "Iosevka Nerd Font Mono:h13"

        header = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        }
    else
        vim.o.guifont = "Iosevka Nerd Font Mono:h15"

        header = {
            "",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣰⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠖⠀⠈⠙⠛⠛⠛⠙⠊⠀⠤⠋⢀⠎⢠⠄⠠⠀⠀⣀⣀⡀⠀⢠⠀⣄⠘⣄⠈⠦⠀⠈⠊⠙⠛⠛⠋⠑⠀⠐⠆⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣀⡤⠀⠀⠈⡄⠰⠆⢀⠜⠉⠉⠉⠑⠒⣤⣀⠀⣸⡀⢠⣄⣀⣿⣿⣇⣀⡬⠀⣼⠀⢀⣤⠖⠂⠉⠉⠉⠛⣀⠀⠆⠀⡏⠀⠀⠠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣠⡞⢋⣉⣀⣐⠒⠓⢀⣀⣉⣀⣀⣀⣀⣚⠛⠻⠯⣀⠈⠉⣀⣸⠉⢹⣿⠉⢹⣀⡈⠉⢀⠨⠟⠛⢓⣀⣀⣀⣀⣈⣁⣀⠚⠓⢂⣀⣈⡉⠳⣄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣧⠈⣿⠩⡟⠭⠽⠭⠉⣉⣉⣉⣉⣉⣉⡙⠛⠶⣦⣈⠂⢌⠛⢀⣽⣿⣅⠝⢉⠔⢈⣤⡶⠞⢛⣉⣉⣉⣉⣉⣉⡉⠭⠿⠭⠹⡯⣹⠇⢠⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⣿⡇⡿⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡌⠻⣷⣄⠡⠈⢿⣿⠃⠐⢁⣼⡟⢉⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⢸⡇⣿⡄⢸⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⠀⣿⡇⢣⣿⣿⣿⣿⠋⠁⢀⠀⠉⢻⣿⣿⣿⣿⡆⠘⣿⡆⠀⢸⣿⠀⠀⣾⡟⢀⣾⣿⣿⣿⡿⠋⠁⢀⠀⠉⢻⣿⣿⣿⡇⠃⣿⡇⢸⣿⣿⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣾⣿⣶⣝⢿⡄⢹⣇⠘⣿⣿⣿⣿⣄⡀⠈⠀⣀⣼⣿⣿⣿⣿⢇⡇⣿⡇⠀⢸⡿⠀⠀⣿⡇⡎⢿⣿⣿⣿⣷⣄⡀⠈⢀⣀⣾⣿⣿⣿⡟⢠⡿⠀⣾⢏⣴⣿⣿⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⣀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⡿⠿⠈⠳⢄⠹⣦⡈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠃⢸⠰⣿⣷⠀⠀⠀⠀⣴⣿⡇⣹⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⣠⠟⢁⠜⠁⠸⠿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣀⠀⠀",
            "⠀⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣥⣂⠀⠈⠙⠳⢦⣬⣍⣉⣛⣛⣉⣭⣵⣒⣒⣒⡬⠷⢹⣿⡤⠾⠿⠦⣾⣿⠰⠧⣔⣒⣒⣲⣭⣍⣛⣛⣋⣩⣥⡴⠶⠛⠁⠀⢀⣢⣥⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣆⢦⣤⣀⡀⠈⠉⠉⠉⠉⠉⠉⠉⠉⡙⠻⣿⠟⢡⣴⣾⣿⣶⣌⠙⣿⡟⢋⡉⠉⠉⠉⠉⠉⠉⠉⠉⢀⣀⣠⣤⢂⣾⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⡿⠿⠿⠛⠛⠉⠉⠁⠀⣈⣽⣽⣛⠻⣿⣿⣿⣿⣿⣿⡷⠀⠸⠀⡟⢀⣿⠿⢿⣿⠿⣿⣆⠸⡄⢨⠀⠰⣿⣿⣿⣿⣿⣿⠿⣛⣻⣿⣍⠀⠈⠉⠉⠛⠛⠻⠿⠿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⡦⠻⠿⠿⢛⣉⠤⠒⡡⠊⣠⣾⣿⠖⢾⡷⠲⣿⣿⣦⡙⠄⠑⠤⣈⡛⠻⠿⠿⠡⣾⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⠿⠟⠛⠉⠁⠀⢀⣾⣶⣶⣤⣄⠡⣴⣾⣿⣿⣿⡓⢚⡟⠒⣿⣿⣿⣿⣶⡬⣀⣤⣴⣶⣶⣄⠀⠀⠉⠙⠻⠿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠿⠟⠋⠉⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⡿⠃⠙⠻⠿⣿⣿⣏⣩⣏⣉⣿⣿⡿⠟⠛⠈⠻⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠉⠙⠻⠿⠛⠉⠁⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠜⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "                                                                                ",
            "                                                                                "
        }
    end

    return {
        {
            "nvimdev/dashboard-nvim",
            event = "VimEnter",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            },
            config = function()
                require("dashboard").setup({
                    theme = "doom",
                    disable_move = false,
                    config = {
                        header = header,
                        center = {
                            { desc = "Files", desc_hl = "Number", key = "f", key_hl = "@class", action= "Telescope find_files", key_format = "%s" },
                            { desc = "Lazy", desc_hl = "Number", key = "l", key_hl = "@class", action= "Lazy", key_format = "%s" },
                            { desc = "Tree", desc_hl = "Number", key = "t", key_hl = "@class", action = "Neotree", key_format = "%s" },
                            -- inflating length of description to make them all line up a good distance
                            { desc = "Dotfiles           ", desc_hl = "Number", key = "d", key_hl = "@class", action = "cd $NVIM_HOME | Neotree", key_format = "%s" }
                        }
                    }
                })
            end
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim"
            },
            config = function()
                vim.diagnostic.config({
                    signs = {
                        text = {
                            [vim.diagnostic.severity.INFO] = "",
                            [vim.diagnostic.severity.HINT] = "",
                            [vim.diagnostic.severity.WARN] = "",
                            [vim.diagnostic.severity.ERROR] = ""
                        },
                        linehl = {
                            [vim.diagnostic.severity.INFO] = "",
                            [vim.diagnostic.severity.HINT] = "",
                            [vim.diagnostic.severity.WARN] = "",
                            [vim.diagnostic.severity.ERROR] = ""
                        },
                        numhl = {
                            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError"
                        }
                    }
                })

                require("neo-tree").setup({
                    enable_diagnostics = true,
                    enable_git_status = true,
                    filesystem = {
                        filtered_items = {
                            visible = true
                        },
                        follow_current_file = {
                            enabled = true
                        }
                    },
                    window = {
                        width = 32
                    },
                    default_component_configs = {
                        modified = {
                            symbol = "[~]"
                        },
                        git_status = {
                            symbols = {
                                added     = "✚",
                                modified  = "",
                                deleted   = "✖",
                                renamed   = "󰁕",

                                untracked = "",
                                ignored   = "#",
                                unstaged  = "u",
                                staged    = "s",
                                conflict  = "c"
                            }
                        }
                    }
                })
            end
        }
    }
else
    return {}
end
