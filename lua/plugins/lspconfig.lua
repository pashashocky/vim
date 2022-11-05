local status, lsp = pcall(require, "lspconfig")
if not status then
    return
end

lsp.golangci_lint_ls.setup(require("languages.go").lsp_golangci)
lsp.gopls.setup(require("languages.go").lsp_gopls)
lsp.sumneko_lua.setup(require("languages.lua").lsp)
lsp.pylsp.setup(require("languages.python").lsp)
lsp.tsserver.setup(require("languages.ts").lsp_tsserver)
lsp.eslint.setup(require("languages.ts").lsp)
lsp.tailwindcss.setup({})
