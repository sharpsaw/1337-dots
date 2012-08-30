" Who writes enough multiline comments that they need autocommenting?
set formatoptions-=or
" (Check :h fo-table )
" (And note that for editing this file you won't see the effect. The
" $VIMRUNTIME/ftplugin/vim.vim re-sets it with ft+=croql)

" (Note: <Leader> is usually backslash)

" Reset to home-base state.
map <Leader><Leader><Leader> :noh<CR>:set nopaste<CR>:set nolist<CR>

map <Leader>p :set paste<CR>

map \gf :sp <cword><CR>

" These also are available as <F1> = \1, if you have
" vim-dots/.vim/plugin/functionkeys.vim
map <Leader>1 :up<cr>
map <Leader>4 :wa<bar>:MakeRakeAntOrRun<cr>
map <Leader>5 :wa<bar>:RunThis<cr>
" Very versatile. Just do something manually, like :wa|!./% foo  then
" subsequent \]'s will repeat it (also available
map <Leader>] :wa<Bar><UP><CR>
map <F8> <Leader>]

func! s:MakeRakeAntOrRun()
  if filereadable('Rakefile')
    setlocal makeprg=rake
  elseif filereadable('Makefile')
    setlocal makeprg=make
  elseif filereadable('build.xml')
    setlocal makeprg=ant\ -emacs
  else
    echo "No Rakefile, Makefile, or build.xml found. Running (maybe use <F5> ?)"
    call s:RunThis()
    return
  end
  make
endfunc
command MakeRakeAntOrRun :call s:MakeRakeAntOrRun()

func! s:RunThis()
  let l:full = expand('%:p')
  if ! filereadable(l:full)
    echo "Odd. Couldn't read ".l:full
    return
  end
  if executable(l:full)
    exe '!'.l:full
  else
    echo "File not executable — use \\exe to make it so."
    map \exe :!chmod +x %<cr>
  end
endfunc
command RunThis :call s:RunThis()
