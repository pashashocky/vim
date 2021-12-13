local lsp = require("lsp.lsp")
local M = {}

M.lsp = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
}

M.efm = {
    {
        formatCommand = "black --quiet -",
        formatStdin = true,
        lintCommand = "flake8 --stdin-display-name ${INPUT} -",
        lintStdin = true,
        lintFormats = {
            "%f:%l:%c: %m",
        },
    },
}

M.all_format = { efm = "Black" }
M.default_format = "efm"

return M
