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

function Yapf()
    if exists("g:yapf_cmd")
        let yapf_cmd=g:yapf_cmd
    else
        let yapf_cmd="yapf"
    endif

    if exists("g:yapf_style")
        let yapf_style=" --style " . g:yapf_style
    else
        let yapf_style=""
    endif

    if !executable(yapf_cmd)
        echoerr "File " . yapf_cmd . " not found. Please install it first."
        return
    endif

    let execmdline=yapf_cmd.yapf_style
    execute "0,$!" . execmdline
endfunction
