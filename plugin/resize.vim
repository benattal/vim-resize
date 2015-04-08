" resize.vim    resizing the screen
" Author:       Breuckelen (Benjamin Attal)
" Version:      1.0

" Globals {{{
let g:resize_count = 1

"}}}

"Is<direction>Most Boolean Functions ---------------------- {{{
function! IsRightMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>l"
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsBottomMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>j"
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsTopMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>k"
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsLeftMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>h"
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction
" }}}

"Resize<direction> functions and helpers ---------------------- {{{
function! CacheResizeCount(n)
    if a:n
        let g:resize_count = a:n
    endif
endfunction

function! ResizeUp(n)
    CacheResizeCount(a:n)
    if IsBottomMost()
        if IsTopMost()
            silent! exec "normal! " . g:resize_count . "\<c-w>-"
        else
            silent! exec "normal! " . g:resize_count . "\<c-w>+"
        endif
    else
        silent! exec "normal! " . g:resize_count . "\<c-w>-"
    endif
endfunction

function! ResizeDown(n)
    CacheResizeCount(a:n)
    if IsBottomMost()
        if IsTopMost()
            silent! exec "normal! " . g:resize_count . "\<c-w>+"
        else
            silent! exec "normal! " . g:resize_count . "\<c-w>-"
        endif
    else
        silent! exec "normal! " . g:resize_count . "\<c-w>+"
    endif
endfunction

function! ResizeLeft(n)
    CacheResizeCount(a:n)
    if IsRightMost()
        if !IsLeftMost()
            silent! exec "normal! " . g:resize_count . "\<c-w>>"
        endif
    else
        silent! exec "normal! " . g:resize_count . "\<c-w><"
    endif
endfunction

function! ResizeRight(n)
    CacheResizeCount(a:n)
    if IsRightMost()
        if !IsLeftMost()
            silent! exec "normal! " . g:resize_count . "\<c-w><"
        endif
    else
        silent! exec "normal! " . g:resize_count . "\<c-w>>"
    endif
endfunction
" }}}

nnoremap <up> :<C-U>call ResizeUp(v:count)<cr>
nnoremap <down> :<C-U>call ResizeDown(v:count)<cr>
nnoremap <left> :<C-U>call ResizeLeft(v:count)<cr>
nnoremap <right> :<C-U>call ResizeRight(v:count)<cr>
