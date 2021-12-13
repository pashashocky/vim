local status, cmp = pcall(require, "cmp")
if not status then
    return
end

local status, lspkind = pcall(require, "lspkind")
if not status then
    return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
local fn = vim.fn

vim.opt.completeopt = "menu,menuone,noselect"

require("tabout").setup({
    tabkey = "",
    backwards_tabkey = "",
})

local replace_keycodes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = fn.col(".") - 1
    if col == 0 or fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- TODO: Replace lspKindIcons
cmp.setup({
    snippet = {
        expand = function(args)
            if luasnip_ok then
                require("luasnip").lsp_expand(args.body)
            else
                vim.fn["vsnip#anonymous"](args.body)
            end
        end,
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = function(_)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                fn.feedkeys(replace_keycodes("<Plug>luasnip-expand-or-jump"), "")
            elseif check_back_space() then
                fn.feedkeys(replace_keycodes("<Tab>"), "n")
            else
                fn.feedkeys(replace_keycodes("<Plug>(Tabout)"))
            end
        end,
        ["<S-Tab>"] = function(_)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                fn.feedkeys(replace_keycodes("<Plug>luasnip-jump-prev"), "")
            elseif check_back_space() then
                fn.feedkeys(replace_keycodes("<C-d>"), "i")
            else
                fn.feedkeys(replace_keycodes("<Plug>(TaboutBack)"))
            end
        end,
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),
    formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
    },
})

vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])
