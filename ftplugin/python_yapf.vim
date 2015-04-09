"=========================================================
" File:        python_yapf.vim
" Author:      Simon Walker <s.r.walker101[at]googlemail.com>
" Last Change: Fri Apr 10 00:08:26 BST 2015
" Version:     0.0.1
" WebPage:     https://github.com/mindriot101/vim-yapf
" License:     MIT Licence
"==========================================================
" see also README.rst

" Only do this when not done yet for this buffer
if exists("b:loaded_yapf_ftplugin")
    finish
endif
let b:loaded_yapf_ftplugin=1

if !exists("*yapf(...)")
    function Yapf(...)

        let l:args = get(a:, 1, '')

        if exists("g:yapf_cmd")
            let yapf_cmd=g:yapf_cmd
        else
            let yapf_cmd="yapf"
        endif

        if !executable(yapf_cmd)
            echoerr "File " . yapf_cmd . " not found. Please install it first."
            return
        endif

        let execmdline=yapf_cmd.l:args
        let tmpfile = tempname()
        let tmpdiff = tempname()
        let index = 0
        try
            " current cursor
            let current_cursor = getpos(".")
            " write to temporary file
            silent execute "!". execmdline . " \"" . expand('%:p') . "\" > " . tmpfile
            " current buffer all delete
            silent execute "%d"
            " read temp file. and write to current buffer.
            for line in readfile(tmpfile)
                call append(index, line)
                let index = index + 1
            endfor
            " remove last linebreak.
            silent execute ":" . index . "," . index . "s/\\n$//g"
            " restore cursor
            call setpos('.', current_cursor)

            " show diff
            redraw!

            hi Green ctermfg=green
            echohl Green
            echon "Fixed with yapf this file."
            echohl

        finally
            " file close
            if filewritable(tmpfile)
                call delete(tmpfile)
            endif
            if filewritable(tmpdiff)
                call delete(tmpdiff)
            endif
        endtry

    endfunction
endif

" Add mappings, unless the user didn't want this.
" The default mapping is registered under to <F8> by default, unless the user
" remapped it already (or a mapping exists already for <F8>)
if !exists("no_plugin_maps") && !exists("no_yapf_maps")
    if !hasmapto('Yapf(')
        noremap <buffer> <F8> :call Yapf()<CR>
        command! -nargs=? -bar Yapf call Yapf(<f-args>) 
    endif
endif
