local api = vim.api

local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
    local function buf_set_option(...)
        api.nvim_buf_set_option(bufnr, ...)
    end
    local function buf_set_keymap(...)
        api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "<space>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "<space>l", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Set in telescope in mappings.lua
    -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

    if client.server_capabilities.document_highlight then
        vim.cmd([[
          hi LspReferenceRead cterm=bold ctermbg=236 guibg=#303030
          hi LspReferenceText cterm=bold ctermbg=236 guibg=#303030
          hi LspReferenceWrite cterm=bold ctermbg=236 guibg=#303030
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]])
    end

    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end

    if client.name == "efm" then
        if client.server_capabilities.document_formatting then
            vim.api.nvim_command([[augroup Format]])
            vim.api.nvim_command([[autocmd! * <buffer>]])
            vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync({},1500)]])
            vim.api.nvim_command([[augroup END]])
        end
    end
end

-- Set up completion using nvim_cmp with LSP source
local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return M
