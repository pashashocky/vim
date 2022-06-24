local status, lspkind = pcall(require, "lspkind")
if not status then
    return
end
local theme = require("theme")

lspkind.init({
    mode = "symbol_text",
    preset = "codicons",
    symbol_map = theme.lspKindIcons,
})
