local status, tree = pcall(require, "nvim-tree")
if not status then
    return
end

vim.g.nvim_tree_indent_markers = 1

tree.setup({
    open_on_setup = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
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
