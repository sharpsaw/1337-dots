" Depends on https://github.com/MarcWeber/vim-addon-manager
call vam#ActivateAddons(['github:Raimondi/delimitMate'], {'auto_install':1})
source ~/.vim/vim-addons/github-Raimondi-delimitMate/plugin/delimitMate.vim

" Tab is better than Shift+Tab
imap <Tab> <Plug>delimitMateS-Tab
