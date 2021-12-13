local lsp = require("lsp.lsp")
local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end

local util = require("lspconfig.util")

lspconfig.efm.setup({
    -- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/sumneko_lua.lua
    -- https://github.com/lithammer/nvim-lspconfig/blob/cb540d593f08a8f962828c95cc95fd63c650cd9f/lua/lspconfig/sumneko_lua.lua
    root_dir = function(fname)
        return util.root_pattern('.git')() or util.path.dirname(fname)
    end,
    filetypes = {
        "go",
        "lua",
        "python",
    },
    init_options = { documentFormatting = true, codeAction = true },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            go = require("languages.go").efm,
            lua = require("languages.lua").efm,
            python = require("languages.python").efm,
        },
    },

    on_attach = lsp.on_attach,

    capabilities = lsp.capabilities,
})
