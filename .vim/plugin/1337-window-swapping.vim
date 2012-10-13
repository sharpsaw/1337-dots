" Originally from #vim's pen:
" http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim/12870120#answer-12870120

function! MarkSwapAway()
    " marked window number
    let g:markedOldWinNum = winnr()
    let g:markedOldBufNum = bufnr("%")
endfunction

function! DoWindowToss()
    let newWinNum = winnr()
    let newBufNum = bufnr("%")
    " Switch focus to marked window
    exe g:markedOldWinNum . "wincmd w"

    " Load current buffer on marked window
    exe 'hide buf' newBufNum

    " Switch focus to current window
    exe newWinNum . "wincmd w"

    " Load marked buffer on current window
    exe 'hide buf' g:markedOldBufNum

    " …and come back to the new one
    exe g:markedOldWinNum . "wincmd w"
endfunction

nnoremap <C-w><C-h> :call MarkSwapAway()<CR> <C-w>h :call DoWindowToss()<CR>
nnoremap <C-w><C-j> :call MarkSwapAway()<CR> <C-w>j :call DoWindowToss()<CR>
nnoremap <C-w><C-k> :call MarkSwapAway()<CR> <C-w>k :call DoWindowToss()<CR>
nnoremap <C-w><C-l> :call MarkSwapAway()<CR> <C-w>l :call DoWindowToss()<CR>

