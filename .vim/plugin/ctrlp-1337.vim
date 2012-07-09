call vam#ActivateAddons(['github:kien/ctrlp.vim'], {'auto_install' : 1})
source ~/.vim/vim-addons/github-kien-ctrlp.vim/plugin/ctrlp.vim

let g:ctrlp_cmd = 'CtrlPMRU' " Much better.

" vsplits are rarely what I want.
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_open_multiple_files = 'h'
