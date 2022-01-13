local status, lualine = pcall(require, "lualine")
if not status then
    return
end
local theme = require("theme")
local signs = theme.signs

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "gruvbox_dark",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
            {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = signs,
            },
            "diff",
            "encoding",
            "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    extensions = { "fugitive" },
})
