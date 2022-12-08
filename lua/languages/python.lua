local lsp = require("lsp.lsp")
local M = {}

M.lsp = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = {
                    enabled = true,
                    maxLineLength = 88,
                },
                pycodestyle = {
                    enabled = false,
                },
            },
        },
    },
}

M.efm = {
    {
        formatCommand = "black --quiet --line-length 88 -",
        formatStdin = true,
        lintCommand = "flake8 --max-line-length 88 --stdin-display-name ${INPUT} -",
        lintStdin = true,
        lintFormats = {
            "%f:%l:%c: %m",
        },
    },
}

M.all_format = { efm = "Black" }
M.default_format = "efm"

return M
