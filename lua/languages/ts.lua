local lsp = require("lsp.lsp")
local M = {}

M.lsp = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
}

M.efm = {
    {
        lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
        lintStdin = true,
        lintFormats = { "%f:%l:%c: %m" },
        lintIgnoreExitCode = true,
        formatCommand = "eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}",
        formatStdin = true,
    },
}

M.all_format = { efm = "ESlint" }
M.default_format = "efm"

return M
