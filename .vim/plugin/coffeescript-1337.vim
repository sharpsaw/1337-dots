if filereadable('.compile-coffeescript-automatically')
  au BufWritePost *.coffee silent CoffeeMake!
  " maybe:
  " au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
end
