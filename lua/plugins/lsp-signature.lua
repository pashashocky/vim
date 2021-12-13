local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
    return
end

lsp_signature.setup({
    handler_opts = {
        border = "rounded",
    },
    floating_window_above_cur_line = false,
    use_lspsaga = true,
    hint_prefix = " ",
    zindex = 50,
})
