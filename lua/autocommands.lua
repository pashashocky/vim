local exec = vim.api.nvim_exec

exec(
    [[
augroup Config
    autocmd!
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
augroup END
]],
    true
)

exec(
    [[
augroup MkdirOnSave
    autocmd!
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END
]],
    true
)

exec(
    [[
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.go,*.gomod,*.py,*.lua lua require('lsp.format').format()
augroup END
]],
    true
)

exec(
    [[
augroup UpdateGlobal
    autocmd!
    autocmd CursorHold,CursorHoldI * silent! lua require'utils.lightbulb'.code_action()
augroup END
]],
    true
)

exec(
    [[
augroup SetTermMaps
    autocmd! TermOpen term://* lua set_terminal_keymaps()
augroup END
]],
    true
)
