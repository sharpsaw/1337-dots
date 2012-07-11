" Depends on https://github.com/MarcWeber/vim-addon-manager
call vam#ActivateAddons(['github:kchmck/vim-coffee-script'], {'auto_install':1})

if filereadable('.compile-coffeescript-automatically')
  au BufWritePost *.coffee silent CoffeeMake!
  " maybe:
  " au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
end
