local status, bufferline = pcall(require, "bufferline")
if not status then
    return
end

local colors = require("theme")

bufferline.setup({
    options = {
        indicator = {
            icon = "▌",
            style = "icon",
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _)
            local icon = level:match("error") and " " or " "
            return "(" .. icon .. count .. ")"
        end,
        offsets = { { filetype = "NvimTree", text = "Explorer", text_align = "center" } },
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_reqular_tabs = true,
    },

    highlights = {
        fill = {
            bg = colors.dark_background,
        },
        background = {
            bg = colors.dark_background,
        },

        tab = {
            fg = colors.comment,
            bg = colors.dark_background,
        },
        tab_selected = {
            fg = colors.white,
            bg = colors.background,
            bold = true,
        },

        buffer_visible = {
            fg = colors.comment,
            bg = colors.dark_background,
        },
        buffer_selected = {
            fg = colors.white,
            bg = colors.background,
            bold = true,
        },

        modified = {
            fg = colors.green,
            bg = colors.background,
        },
        modified_visible = {
            fg = colors.green,
            bg = colors.dark_background,
        },
        modified_selected = {
            fg = colors.green,
            bg = colors.background,
        },

        error = {
            fg = colors.red,
            bg = colors.background,
        },
        error_visible = {
            fg = colors.red,
            bg = colors.dark_background,
        },
        error_selected = {
            fg = colors.red,
            bg = colors.background,
        },

        error_diagnostic = {
            fg = colors.red,
            bg = colors.background,
        },
        error_diagnostic_visible = {
            fg = colors.red,
            bg = colors.dark_background,
        },
        error_diagnostic_selected = {
            fg = colors.red,
            bg = colors.background,
        },

        warning = {
            fg = colors.yellow,
            bg = colors.background,
        },
        warning_visible = {
            fg = colors.yellow,
            bg = colors.dark_background,
        },
        warning_selected = {
            fg = colors.yellow,
            bg = colors.background,
        },

        warning_diagnostic = {
            fg = colors.yellow,
            bg = colors.background,
        },
        warning_diagnostic_visible = {
            fg = colors.yellow,
            bg = colors.dark_background,
        },
        warning_diagnostic_selected = {
            fg = colors.yellow,
            bg = colors.background,
        },

        info = {
            fg = colors.green,
            bg = colors.background,
        },
        info_visible = {
            fg = colors.green,
            bg = colors.dark_background,
        },
        info_selected = {
            fg = colors.green,
            bg = colors.background,
        },

        info_diagnostic = {
            fg = colors.green,
            bg = colors.background,
        },
        info_diagnostic_visible = {
            fg = colors.green,
            bg = colors.dark_background,
        },
        info_diagnostic_selected = {
            fg = colors.green,
            bg = colors.background,
        },

        indicator_selected = {
            fg = colors.blue,
            bg = colors.background,
        },

        separator = {
            fg = colors.white,
        },
    },
})
