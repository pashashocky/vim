local status, gitsigns = pcall(require, "gitsigns")
if not status then
    return
end

gitsigns.setup({
    signs = {
        add = { hl = "GitSignsAdd", text = "▌" },
        change = { hl = "GitSignsChange", text = "▌" },
        delete = { hl = "GitSignsDelete", text = "▌" },
    },
    current_line_blame = false,
})
