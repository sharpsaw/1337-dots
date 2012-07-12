" Because of the way runtimepath works, these lines have to be in .vimrc, not
" .vim/plugin/*
let s:want = [
      \'github:Raimondi/delimitMate',
      \'github:kien/ctrlp.vim',
      \'github:Lokaltog/vim-powerline'
      \]
call vam#ActivateAddons(s:want, {'auto_install' : 1})
