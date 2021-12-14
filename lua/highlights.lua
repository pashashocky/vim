local colors = require("theme")

local base00 = "#282c34"
local base01 = "#353b45"
local base02 = "#3e4451"
local base03 = "#545862"
local base04 = "#565c64"
local base05 = "#abb2bf"
local base06 = "#b6bdca"
local base07 = "#c8ccd4"
local base08 = colors.red
local base09 = colors.orange
local base0A = colors.yellow
local base0B = colors.green
local base0C = colors.cyan
local base0D = colors.blue
local base0E = colors.purple
local base0F = colors.tomato

local cmd = vim.cmd

local function highlight(all_highlights)
    for group, ui in pairs(all_highlights) do
        local guifg = ui.guifg or "NONE"
        local guibg = ui.guibg or "NONE"
        local gui = ui.gui or "NONE"
        if gui == "underline" or gui == "undercurl" then
            local guisp = ui.guisp or "NONE"
            cmd(string.format("hi %s guifg=%s guibg=%s gui=%s guisp=%s", group, guifg, guibg, gui, guisp))
        else
            cmd(string.format("hi %s guifg=%s guibg=%s gui=%s", group, guifg, guibg, gui))
        end
    end
end

-- Credit https://github.com/RRethy/nvim-base16/blob/master/lua/base16-colorscheme.lua
highlight({
    -- General
    -- Conceal = { guifg = base0D, guibg = base00 },
    Cursor = { guifg = base00 },
    CursorLine = { guibg = colors.cursorLine },
    CursorLineNr = { guifg = base0A, guibg = colors.cursorLine },
    Directory = { guifg = base0D },
    ErrorMsg = { guifg = base08, guibg = colors.background },
    Folded = { guifg = colors.comment, guibg = colors.cursorLine },
    IncSearch = { guifg = base01, guibg = base09 },
    LineNr = { guifg = colors.lineNumber, guibg = colors.background },
    -- Macro = { guifg = base08 },
    MatchParen = { guibg = base03 },
    MoreMsg = { guifg = colors.cyan },
    NonText = { guifg = colors.comment },
    Normal = { guifg = base05, guibg = colors.background },
    -- Normal = { guibg = colors.background },
    NormalFloat = { guifg = base05, guibg = colors.dark_background },
    NormalNC = { guifg = base05, guibg = colors.background },
    FloatBorder = { guifg = base05, guibg = base00 },

    Pmenu = { guifg = base05, guibg = colors.dark_background },
    PmenuSbar = { guifg = base05, guibg = colors.dark_background },
    PmenuSel = { guifg = colors.dark_background, guibg = colors.yellow },
    PmenuThumb = { guifg = base05, guibg = colors.scrollbar },

    CmpItemMenu = { guifg = base05, guibg = colors.dark_background },
    CmpItemKind = { guifg = colors.cyan },
    CmpItemKindMethod = { guifg = base0A },
    CmpItemKindFunction = { guifg = base0E },
    CmpItemAbbrMatchFuzzy = { guifg = colors.yellow },
    CmpItemAbbrMatch = { guifg = colors.yellow },
    CmpItemAbbr = { guifg = base05 },
    CmpItemAbbrDeprecated = { guifg = "#ffffff" },

    Question = { guifg = base0D },
    -- QuickFixLine = { guibg = base01 },
    Search = { guifg = colors.blue },
    SignColumn = { guifg = base04, guibg = colors.background },
    SpecialKey = { guifg = base03 },
    StatusLine = { guifg = base04, guibg = base02 },
    StatucLineNC = { guifg = colors.border, guibg = colors.dark_background, gui = "underline" },
    Substitute = { guifg = colors.blue },
    TermCursor = { guifg = colors.background, guibg = base0C },
    TermCursorNC = { guifg = colors.background, guibg = base05 },
    Title = { guifg = base0D },
    VertSplit = { guifg = colors.dark_background, guibg = colors.dark_background },
    Visual = { guibg = colors.cursorLine },
    VisualNOS = { guifg = base08 },
    WarningMsg = { guifg = base08 },
    -- WildMenu = { guifg = base00, guibg = base05 },

    -- Spell
    SpellBad = { gui = "undercurl", guisp = base08 },
    SpellLocal = { gui = "undercurl", guisp = base0C },
    SpellCap = { gui = "undercurl", guisp = base0D },
    SpellRare = { gui = "undercurl", guisp = base0E },

    -- Syntax
    Comment = { guifg = base03, gui = "italic" },
    Constant = { guifg = base09, gui = "italic" },
    String = { guifg = base0B },
    Character = { guifg = colors.yellow },
    Number = { guifg = base09, gui = "italic" },
    Boolean = { guifg = base09, gui = "italic" },
    Float = { guifg = base09, gui = "italic" },
    Identifier = { guifg = colors.purple },
    Fuction = { guifg = base0D },
    Statement = { guifg = base0E },
    Conditional = { guifg = base0E, gui = "italic" },
    Repeat = { guifg = base0E, gui = "italic" },
    Label = { guifg = base0E },
    Operator = { guifg = colors.blue },
    Keyword = { guifg = base0E, gui = "italic" },
    Exception = { guifg = base0E },
    PreProc = { guifg = base0A },
    Include = { guifg = base0D },
    Define = { guifg = base0D },
    Marco = { guifg = base0D },
    PreCondit = { guifg = base0D },
    Type = { guifg = base0D },
    TypeDef = { guifg = base0A },
    StorageClass = { guifg = base0E },
    Structure = { guifg = base0E },
    Special = { guifg = colors.yellow },
    SpecialChar = { guifg = colors.yellow },
    Tag = { guifg = base0A, gui = "underline" },
    Delimiter = { guifg = colors.blue }, -- . {}
    SpecialComment = { guifg = colors.yellow },
    Debug = { guifg = base08 },
    Underlined = { guifg = base05, gui = "bold,underline" },
    Error = { guifg = base00, guibg = base08 },
    Todo = { guifg = base0A, guibg = base01 },

    -- LSP
    LspReferenceText = { gui = "underline", guisp = base04 },
    LspReferenceRead = { gui = "underline", guisp = base04 },
    LspReferenceWrite = { gui = "underline", guisp = base04 },
    DiagnosticError = { guifg = base08 },
    DiagnosticWarn = { guifg = base0A },
    DiagnosticInfo = { guifg = base0D },
    DiagnosticHint = { guifg = base0B },
    DiagnosticUnderlineError = { gui = "undercurl", guisp = base08 },
    DiagnosticUnderlineWarn = { gui = "undercurl", guisp = base0A },
    DiagnosticUnderlineInfo = { gui = "undercurl", guisp = base0D },
    DiagnosticUnderlineHint = { gui = "undercurl", guisp = base0B },

    -- Treesitter
    TSAnnotation = { guifg = colors.deep_purple },
    TSAttribute = { guifg = colors.deep_purple },
    TSBoolean = { guifg = base09, gui = "italic" },
    TSCharacter = { guifg = base0C },
    TSComment = { guifg = base03, guibg = colors.base00, gui = "italic" },
    TSConstructor = { guifg = base0C },
    TSConditional = { guifg = colors.deep_purple, gui = "italic" },
    TSConstant = { guifg = base09, gui = "italic" },
    TSConstBuiltin = { guifg = base0E },
    TSConstMacro = { guifg = base0E },
    TSError = { guifg = base08 },
    TSException = { guifg = base0E },
    TSField = { guifg = colors.cyan },
    TSFloat = { guifg = base09, gui = "italic" },
    TSFunction = { guifg = colors.yellow },
    TSFuncBuiltin = { guifg = colors.yellow, gui = "italic" },
    TSFuncMarcro = { guifg = colors.yellow },
    TSInclude = { guifg = colors.purple },
    TSKeyword = { guifg = colors.red, gui = "italic" },
    TSKeywordFunction = { guifg = colors.red, gui = "italic" },
    TSKeywordOperator = { guifg = colors.blue, gui = "italic" },
    TSLabel = { guifg = base0E },
    TSMethod = { guifg = colors.yellow },
    TSNamespace = { guifg = base0E },
    TSNone = { guifg = base0E },
    TSNumber = { guifg = colors.cyan, gui = "italic" },
    TSOperator = { guifg = colors.blue },
    TSParameter = { guifg = colors.beige },
    TSParameterReference = { guifg = colors.beige },
    TSProperty = { guifg = colors.grey07 },
    TSPunctDelimiter = { guifg = colors.cyan }, -- . ,
    TSPunctBracket = { guifg = colors.blue },
    TSPunctSpecial = { guifg = colors.blue },
    TSRepeat = { guifg = colors.deep_purple, gui = "italic" }, -- for
    TSString = { guifg = colors.grey05 },
    TSStringRegex = { guifg = base0B },
    TSStringEscape = { guifg = base0C },
    TSStringSpecial = { guifg = base0B },
    TSSymbol = { guifg = base0B },
    TSTag = { guifg = base0A },
    TSTagAttribute = { guifg = base0A },
    TSTagDelimiter = { guifg = base0F },
    TSText = { guifg = colors.beige },
    TSStrong = { gui = "bold" },
    TSEmphasis = { guifg = base09, gui = "italic" },
    TSUnderline = { guifg = base00, gui = "underline" },
    TSStrike = { guifg = base00, gui = "strikethrough" },
    TSTitle = { guifg = base0D },
    TSLiteral = { guifg = base09 },
    TSURI = { guifg = base09, gui = "underline" },
    TSMath = { guifg = base0E },
    TSType = { guifg = base0A, gui = "italic" },
    TSTypeBuiltin = { guifg = base0E },
    TSVariable = { guifg = colors.beige },
    TSVariableBuiltin = { guifg = colors.grey07, "italic" },

    -- TSDefinition = { gui = 'underline', guisp = base04 },
    -- TSDefinitionUsage = { gui = 'underline', guisp = base04 },
    -- TSCurrentScope = { gui = 'bold' },

    -- Diff
    DiffAdd = { guifg = base0B, guibg = base00 },
    DiffChange = { guifg = base03, guibg = base00 },
    DiffDelete = { guifg = base08, guibg = base00 },
    DiffText = { guifg = base0D, guibg = base00 },
    DiffAdded = { guifg = base0B, guibg = base00 },
    DiffFile = { guifg = base08, guibg = base00 },
    DiffNewFile = { guifg = base0B, guibg = base00 },
    DiffLine = { guifg = base0D, guibg = base00 },
    DiffRemoved = { guifg = base08, guibg = base00 },

    IndentBlanklineContextChar = { guifg = base0A },

    -- Status line
    StatuslineBackground = { guibg = colors.dark_background },
    StatuslineDiagnosticsError = { guifg = base08, guibg = colors.dark_background },
    StatuslineDiagnosticsWarning = { guifg = base0A, guibg = colors.dark_background },
    StatuslineDiffAdded = { guifg = base0B, guibg = colors.dark_background },
    StatuslineDiffModified = { guifg = base0D, guibg = colors.dark_background },
    StatuslineDiffRemoved = { guifg = base08, guibg = colors.dark_background },
    StatuslineSmiley = { guifg = base0A, guibg = colors.dark_background },

    DapBreakpoint = { guifg = base08 },
    DapStopped = { guifg = base0B },

    -- GitSign
    GitSignsAdd = { guifg = base0B, guibg = colors.background },
    GitSignsChange = { guifg = base0D, guibg = colors.background },
    GitSignsDelete = { guifg = base08, guibg = colors.background },

    TroubleNormal = { guibg = colors.dark_background },

    YanilNormal = { guibg = colors.dark_background },
    YanilDeviconDirectory = { guifg = "#cccccc" },
    YanilDeviconFile = { guifg = "#cccccc" },
    YanilTreeRoot = { guifg = colors.white },
    YanilGitModified = { guifg = base0A },
    YanilGitDirty = { guifg = base0A },
    YanilGitClean = { guifg = base0B },
    YanilIndentMarker = { guifg = colors.indent },

    -- Nvim-tree
    NvimTreeFolderIcon = { guifg = base0D },
    NvimTreeFolderName = { guifg = colors.white },
    NvimTreeOpenedFolderName = { guifg = colors.white },
    NvimTreeEmptyFolderName = { guifg = colors.white },
    NvimTreeOpenedFile = { guifg = colors.white },
    NvimTreeIndentMarker = { guifg = colors.indent },
    NvimTreeVertSplit = { guifg = colors.dark_background, guibg = colors.dark_background },
    NvimTreeStatuslineNc = { guifg = colors.dark_background, guibg = colors.dark_background, gui = "underline" },
    NvimTreeNormal = { guibg = colors.dark_background },
    NvimTreeRootFolder = { guifg = colors.white, gui = "bold" },

    -- Telescope
    TelescopeBorder = { guifg = colors.border },
    TelescopePromptBorder = { guifg = colors.border },
    TelescopeResultsBorder = { guifg = colors.border },
    TelescopePreviewBorder = { guifg = colors.border },

    DapUIFloatBorder = { guifg = colors.border },

    DashboardHeader = { guifg = colors.comment },
    DashboardCenter = { guifg = colors.comment },
    DashboardShortcut = { guifg = colors.comment },

    ScrollView = { guibg = colors.scrollbar },
})

vim.g.terminal_color_0 = base00
vim.g.terminal_color_1 = base08
vim.g.terminal_color_2 = base0B
vim.g.terminal_color_3 = base0A
vim.g.terminal_color_4 = base0D
vim.g.terminal_color_5 = base0E
vim.g.terminal_color_6 = base0C
vim.g.terminal_color_7 = base05
vim.g.terminal_color_8 = base03
vim.g.terminal_color_9 = base08
vim.g.terminal_color_10 = base0B
vim.g.terminal_color_11 = base0A
vim.g.terminal_color_12 = base0D
vim.g.terminal_color_13 = base0E
vim.g.terminal_color_14 = base0C
vim.g.terminal_color_15 = base07
