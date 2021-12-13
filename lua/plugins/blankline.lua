local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
    return
end

indent_blankline.setup({
    char = "▏",
    buftype_exclude = { "terminal" },
    filetype_exclude = { "help", "dashboard", "lspinfo", "markdown", "gomod", "Yanil", "windline" },
    use_treesitter = true,
    show_current_context = true,
    --     show_end_of_line = true,

    context_patterns = {
        "declaration",
        "expression",
        "pattern",
        "primary_expression",
        "statement",
        "switch_body",
        "function",
        "table", -- Lua
        "block", -- CSS
        "element", -- HTML
        "object", -- JS
        "class",
    },
})
