" resize.vim    resizing the screen
" Author:       Breuckelen (Benjamin Attal)
" Version:      1.0


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

"Resize<direction> function ---------------------- {{{
let g:resize_count = 1

function! ResizeUp(n)
    if a:n > 0
        let g:resize_count = a:n
    endif
    if IsBottomMost()
        if IsTopMost()
            silent! exec "normal " . g:resize_count . "\<c-w>-"
        else
            silent! exec "normal " . g:resize_count . "\<c-w>+"
        endif
    else
        silent! exec "normal " . g:resize_count . "\<c-w>-"
    endif
endfunction

function! ResizeDown(n)
    if a:n > 0
        let g:resize_count = a:n
    endif
    if IsBottomMost()
        if IsTopMost()
            silent! exec "normal " . g:resize_count . "\<c-w>+"
        else
            silent! exec "normal " . g:resize_count . "\<c-w>-"
        endif
    else
        silent! exec "normal " . g:resize_count . "\<c-w>+"
    endif
endfunction

function! ResizeLeft(n)
    if a:n > 0
        let g:resize_count = a:n
    endif
    if IsRightMost()
        if !IsLeftMost()
            silent! exec "normal " . g:resize_count . "\<c-w>>"
        endif
    else
        silent! exec "normal " . g:resize_count . "\<c-w><"
    endif
endfunction

function! ResizeRight(n)
    if a:n > 0
        let g:resize_count = a:n
    endif
    if IsRightMost()
        if !IsLeftMost()
            silent! exec "normal " . g:resize_count . "\<c-w><"
        endif
    else
        silent! exec "normal " . g:resize_count . "\<c-w>>"
    endif
endfunction
" }}}

nnoremap <up> :<C-U>call ResizeUp(v:count ? v:count : 0)<cr>
nnoremap <down> :<C-U>call ResizeDown(v:count ? v:count : 0)<cr>
nnoremap <left> :<C-U>call ResizeLeft(v:count ? v:count : 0)<cr>
nnoremap <right> :<C-U>call ResizeRight(v:count ? v:count : 0)<cr>
