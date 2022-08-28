local lsp = require("lsp.lsp")
local M = {}

M.lsp = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
}

M.lsp_tsserver = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
}

M.prettier = {
    formatCommand = ([[
            prettier
            ${--tab-width:Tabwidth}
            ${--print-width:printWidth}
            ${--single-quote:singleQuote}
            ${--trailing-comma:trailingComma}
        ]]):gsub("\n", ""),
}

M.eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT} --cache",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    -- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    -- formatStdin = true,
}

M.efm = { M.eslint, M.prettier }

M.all_format = { efm = "Prettier" }
M.default_format = "efm"

return M
