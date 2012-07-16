" These are in functions to prevent messing up your /-history. (:h search-undo)
function! Ruby19Hashify()
  s/:\(\S\+\)\s*=> /\1: /g
endfunction
map <Leader>9 :call Ruby19Hashify()<cr>

function! SingleQuotify()
  s/"/'/g
endfunction
map <Leader>' :call SingleQuotify()<cr>

function! DoubleQuotify()
  s/'/"/g
endfunction
map <Leader>" :call DoubleQuotify()<cr>

function! WeHateSuperfluousParens()
  s/(/ /g
  s/)//g
endfunction
map <Leader>0 :call WeHateSuperfluousParens()<cr>
