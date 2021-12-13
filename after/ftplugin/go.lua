vim.opt_local.tabstop = 4
vim.opt_local.expandtab = false
vim.opt.indentexpr = 'nvim_treesitter#indent()'

local status, cmp = pcall(require, "cmp")
if status then
    cmp.setup.buffer({
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        },
    })
end
