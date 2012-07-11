" Because of the way runtimepath works, these lines have to be in .vimrc, not
" .vim/plugin/*
call vam#ActivateAddons(['github:Raimondi/delimitMate'], {'auto_install':1})
call vam#ActivateAddons(['github:kien/ctrlp.vim'], {'auto_install' : 1})
