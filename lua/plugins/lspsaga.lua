local status, lspsaga = pcall(require, "lspsaga")
if not status then
    return
end

-- TODO: Move from here
lspsaga.init_lsp_saga({
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    finder_definition_icon = " ",
    finder_reference_icon = " ",
    border_style = "round",

})
