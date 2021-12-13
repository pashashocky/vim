local status, lspkind = pcall(require, "lspkind")
if not status then
    return
end
local theme = require("theme")

lspkind.init({
    with_text = true,
    preset = "codicons",
    symbol_map = theme.lspKindIcons,
})
