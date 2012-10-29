1337-dots
=========

Aggressive config stuff for the adventurous user.

Context
-------

Why "-dots"?  See the system I start with:

  zsh <(curl sharpsaw.org/init)

Content
-------

* vim stuff:
  - `.vim/plugin/1337-keys.vim` - Changes formatoptions to favor comments
    less.
  - `.vim/ftplugin/ruby_syntaxshortcuts.vim`
     * `\9` for converting to Ruby 1.9-style hash args
     * `\0` to kill parens
     * `\'` to switch to single quotes (this and the next needs to be
       available more generally)
     * '\"' to switch to single quotes
  - coffee-1337.vim - Auto-write `.js` from `.cs`, if you have a file in the
    current dir named `.compile-coffeescript-automatically`
  - delimitmate-addon.vim - Automatically close [ ( ' etc.
     * `<Tab>` hops over the closing delimiters
     * `"<Tab><Backspace>` if you only want one `"` (`^V"` also does this)
     * perl-dots just disables this addon for Perl.
  - Powerline - A more informative status bar. For super1337 mode try to get
    the font patches going.
  - NERDCommenter - Enable `<leader>cc` (comment) and `<leader>cu` (uncomment), in an Acmeist way.
  - Gundo - Sweet navigator around the undo tree. Have +python then :GundoToggle
     * Bound as <leader>gu (which, for me, is \gu and <space>gu)
  - [surround](http://www.vim.org/scripts/script.php?script_id=1697) - cs"', etc.
* zsh stuff:
  - Add zaw (supergood thing that's kind of like CtrlP. Bound to `^x;`)
  - Add zsh-syntax-highlighting, which is good because you get instant
    feedback if something is typed as you expect.
  - .zsh/rc/autojump - Adds the 'j' command, if you've installed autojump.
* X11 stuff:
  * `.Xmodmap` - Gives you `Hyper_L` instead of `Caps_Lock`, plus `Multi_key`
  * xmonad.hs - Xmonad is the best window manager out there. This file makes
    use .Xresources of `Hyper_L` and adds a few layouts.
* Ruby
  - `.irbrc` - Run `pry` instead of old `irb`
* `README.md`: A self-referential file.

Contact
-------

rking-1337-dots@sharpsaw.org

Ask/tell/demand anything. I'll be receptive.
