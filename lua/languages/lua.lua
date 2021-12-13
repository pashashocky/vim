local lsp = require("lsp.lsp")
local M = {}

local util = require("lspconfig.util")
M.lsp = {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    root_dir = function(fname)
        return util.root_pattern('.git')() or util.path.dirname(fname)
    end
}

M.efm = {
    {
        formatCommand = "stylua - --config-path ~/.config/nvim/lua/lsp/stylua.toml",
        formatStdin = true,
    },
}

M.all_format = { efm = "Stylua" }
M.default_format = "efm"

return M
