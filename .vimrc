" Because of the way runtimepath works, these lines have to be in .vimrc, not
" .vim/plugin/*

" delimitMate - Automatically close [ ( ' etc.
"   Tab hops over the closing delimiters
"   ^v" will insert a non-matched "
"   perl-dots just disables this for Perl.

" ctrlp - Amazing fuzzy-finder starting with ^P. Check out :h CtrlP

" powerline - Cool status bar spiffout.
set laststatus=2 " and this is to make sure it shows up with only one window

" nerdcommenter - Enable \cc (comment) and \cu (uncomment), in an Acmeist way.

" Gundo - Sweet navigator around the undo tree. Have +python then :GundoToggle

" surround - cs"', etc. ( http://www.vim.org/scripts/script.php?script_id=1697 )
let s:want = [
      \'github:Raimondi/delimitMate',
      \'github:kien/ctrlp.vim',
      \'github:Lokaltog/vim-powerline',
      \'github:scrooloose/nerdcommenter',
      \'github:vim-scripts/Gundo',
      \'surround',
      \]
call vam#ActivateAddons(s:want, {'auto_install' : 1})
