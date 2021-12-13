" Credit: zeraphel from libera #neovim irc chat

let g:jumpstack = { 'last': [-1,-1], 'jumps': [] }

let s:fail = [-1,-1,-1]
let s:timeout = 0.1


augroup trackPrevView
    au!
    au VimEnter,WinEnter,BufEnter * call <sid>update()
    au TabClosed * call <sid>closed(0)
    au WinClosed * call <sid>closed(1)
    au BufDelete * call <sid>closed(2)
augroup end


nnoremap  <silent> <Plug>(prev) :<c-u>call <SID>previous()<cr>


function! s:closed(what) abort
    let val = expand("<afile>")
    call filter(g:jumpstack.jumps,'v:val[a:what] != val')

    " renumber tabs greater than X when tab X is closed.
    if a:what == 0
        for j in g:jumpstack.jumps
            let j[0] = j[0] > val ? j[0]-1 : j[0]
        endfor
    endif

    " log where ever you end up after closing something
    call s:update()
endfunction


function! s:enough_time_elapsed(now) abort
    let diff = reltime(g:jumpstack.last, a:now)

    if reltimefloat(diff) > s:timeout
        let g:jumpstack.last = a:now
        return 1

    endif
    return 0
endfunction


function! s:update() abort

    let pos = [tabpagenr(), win_getid(), bufnr()]
    if nvim_win_get_config(pos[1]).relative != ''
        return

    elseif len(g:jumpstack.jumps) && g:jumpstack.jumps[-1] == pos
        return
    endif

    let jumps = g:jumpstack.jumps

    if ! s:enough_time_elapsed(reltime())
        if len(jumps)
            let g:jumpstack.jumps[-1] = pos

        else
            let g:jumpstack.jumps = [ pos ]

        endif
    else
        if len(g:jumpstack.jumps) > 1 && get(jumps,-2,s:fail) == pos
            let [g:jumpstack.jumps[-1],g:jumpstack.jumps[-2]] =
                        \ [g:jumpstack.jumps[-2],g:jumpstack.jumps[-1]]

        else
            let g:jumpstack.jumps = add(jumps[-min([10,len(jumps)]):], pos)

        endif
    endif
endfunction


function! s:previous() abort

    let pos = [tabpagenr(), win_getid(), bufnr()]

    if nvim_win_get_config(pos[1]).relative != ''
        return
    endif

    if len(g:jumpstack.jumps) < 2 | return s:update() | endif

    let jumps = g:jumpstack.jumps
    let [i, m] = [1, len(jumps)]

    while i <= m && jumps[-i] == pos
        let i += 1
    endwhile | let i = - i

    if pos[0] != jumps[i][0]
        exe 'tabn ' . jumps[i][0]
        return

    elseif pos[1] != jumps[i][1]
        wincmd p
        return

    elseif pos[2] != jumps[i][2] && len(expand('#'))
        edit #
        return

    endif

    echohl Error
    echo "Nothing to jump to"
    echohl None

endfunction


call s:update()
