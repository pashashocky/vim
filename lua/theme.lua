local M = {
    red = "#EB6F92",
    orange = "#CD9731",
    yellow = "#F6C177",
    green = "#75B782",
    cyan = "#87AFD7",
    blue = "#00AFD7",
    purple = "#C4A7E7",
    deep_purple = "#875FFF",
    tomato = "#F44747",
    white = "#FFFFFF",
    beige = "#EBBCBA",

    background = "#191724",
    dark_background = "#303030",

    border = "#3E4451",
    comment = "#5C6370",
    lineNumber = "#495162",
    scrollbar = "#4E5666",
    cursorLine = "#2C313A",
    indent = "#383C44",

    grey00 = "#303030",
    grey01 = "#353b45",
    grey02 = "#3e4451",
    grey03 = "#545862",
    grey04 = "#565c64",
    grey05 = "#abb2bf",
    grey06 = "#b6bdca",
    grey07 = "#c8ccd4",
}

M.signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Information = " ",
}

M.lspKindIcons = {
    Class = " (class)",
    Color = " (color)",
    Constant = " (constant)",
    Constructor = " (constructor)",
    Enum = " (enum)",
    EnumMember = " (enum member)",
    Event = " (event)",
    Field = " (field)",
    File = " (file)",
    Folder = " (folder)",
    Function = " (function)",
    Interface = " (interface)",
    Keyword = " (keyword)",
    Method = " (method)",
    Module = "{} (module)",
    Operator = " (operator)",
    Property = " (property)",
    Reference = " (reference)",
    Snippet = " (snippet)",
    Struct = " (enum)",
    Text = " (text)",
    TypeParameter = " (type parameter)",
    Unit = " (unit)",
    Value = " (value)",
    Variable = " (variable)",
}

return M
