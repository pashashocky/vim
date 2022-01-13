local lsp = require("lsp.lsp")
local M = {}

M.lsp_gopls = {
    on_attach = lsp.on_attach,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
        },
    },
    capabilities = lsp.capabilities,
}

M.lsp_golangci = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    -- list of options: https://golangci-lint.run/usage/quick-start/
    -- init options for golangci-lint
    init_options = {
        command = {
            "golangci-lint",
            "run",
            "--enable-all",
            "--disable",
            "maligned,lll",
            "--out-format",
            "json",
        },
    },
}

M.efm = {
    {
        formatCommand = "goimports",
        formatStdin = true,
    },
    {
        formatCommand = "gofumpt",
        formatStdin = true,
    },
}

M.all_format = { efm = "Goimports   Gofumpt" }
M.default_format = "efm"

return M
