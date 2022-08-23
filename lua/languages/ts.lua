local lsp = require("lsp.lsp")
local M = {}

M.lsp = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
}

return M
