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
        return util.root_pattern(".git/")() or util.path.dirname(fname)
    end,
    filetypes = {
        "go",
        "html",
        "javascript",
        "javascript.jsx",
        "javascriptreact",
        "json",
        "lua",
        "python",
        "scss",
        "typescript",
        "typescript.jsx",
        "typescriptreact",
        "yaml",
    },
    init_options = { documentFormatting = true, codeAction = true },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            go = require("languages.go").efm,
            html = { require("languages.ts").prettier },
            javascript = require("languages.ts").efm,
            ["javascript.jsx"] = require("languages.ts").efm,
            javascriptreact = require("languages.ts").efm,
            json = require("languages.ts").efm,
            lua = require("languages.lua").efm,
            python = require("languages.python").efm,
            scss = { require("languages.ts").prettier },
            typescript = require("languages.ts").efm,
            ["typescript.jsx"] = require("languages.ts").efm,
            typescriptreact = require("languages.ts").efm,
            yaml = { require("languages.ts").prettier },
        },
    },
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
})
