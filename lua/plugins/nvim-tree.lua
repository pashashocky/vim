local status, tree = pcall(require, "nvim-tree")
if not status then
    return
end
local theme = require("theme")
local signs = theme.signs

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
        adaptive_size = true,
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
    respect_buf_cwd = true,
})
