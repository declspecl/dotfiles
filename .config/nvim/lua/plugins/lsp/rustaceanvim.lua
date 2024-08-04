
return {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    config = function()
        vim.g.rustaceanvim = {
            tools = {
                -- using nvim 0.10 inlay hints, dont need this
                -- inlay_hints = {
                --     auto = false
                -- },
                code_actions = {
                    ui_select_fallback = true
                },
                hover_actions = {
                    auto_focus = true
                }
            },
            inlay_hints = {
                -- just being safe in case some colorschemes dont set LspInlayHint
                highlight = "Comment"
            },
            server = {
                on_attach = function(client, bufnr)
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(bufnr, true)
                    else
                        -- print("Inlay hints are not available for the current client")
                    end

                    vim.keymap.set("n", "<leader>sa", vim.lsp.buf.hover, { remap = false, desc = "Show hover actions" } )
                    vim.keymap.set("n", "<leader>sc", function() vim.cmd.RustLsp("codeAction") end, { remap = false, desc = "Show code actions" } )
                    vim.keymap.set("n", "<leader>sr", function() vim.cmd.RustLsp("runnables") end, { remap = false, desc = "Show runnables" } )
                    vim.keymap.set("n", "<leader>se", function() vim.cmd.RustLsp("explainError") end, { remap = false, desc = "Explain this error" } )
                    vim.keymap.set("n", "<leader>sj", function() vim.cmd.RustLsp("joinLines") end, { remap = false, desc = "Joins selected lines" } )

                    -- from lspconfig settings
				    vim.keymap.set("n", "<leader>ss", vim.lsp.buf.definition, { remap = false, desc = "Show definition" } )
				    vim.keymap.set("n", "<leader>sd", vim.lsp.buf.declaration, { remap = false, desc = "Show declaration" } )
				    vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, { remap = false, desc = "Show references" } )
				    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { remap = false, desc = "Signature help" } )

                    -- using nvim 0.10 inlay hints, dont need this
                    -- require("lsp-inlayhints").on_attach(client, bufnr)
                end,
                settings = {
                    ["rust-analyzer"] = {
                        cmd = { "rustup", "run", "nightly", "rust-analyzer" },
                        cargo = {
                            autoReload = true,
                            checkOnSave = true,
                            allFeatures = true
                        },
                        check = {
                            command = "check"
                        }
                    }
                }
            }
        }
    end
}
