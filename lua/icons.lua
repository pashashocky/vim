local fn = vim.fn
local theme = require("theme")

fn.sign_define("CodeActionSign", { text = "💡", texthl = "DiagnosticInfo" })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
        spacing = 4,
        prefix = "☠️",
    },
})

local signs = theme.signs

-- Credit https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local lspKindIcons = theme.lspKindIcons

-- Credit https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
    kinds[i] = lspKindIcons[kind] or kind
end
