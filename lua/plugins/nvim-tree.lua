local status, tree = pcall(require, "nvim-tree")
if not status then
    return
end
local theme = require("theme")
local signs = theme.signs

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_respect_buf_cwd = 1

tree.setup({
    open_on_setup = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    diagnostics = {
        enable = true,
        icons = signs,
    },
    filters = {
        custom = { "*.tmp", ".git" },
    },
    view = {
        width = 30,
        side = "right",
        auto_resize = true,
    },
})
