1337-dots
=========

Aggressive config stuff for the adventurous user.

Context
-------

Why "-dots"?  See the system I start with:

  curl sharpsaw.org/init | sh

Content
-------

* `.tmux.conf` - Tmux is way better than `screen`, and this is a few tweaks to
  make it even better. You'll have to read the file itself to get the full
  details, but:
  - If you set the env var `$TMUXESC` before starting the tmux server, it will
    allow you to override the default prefix key. This is especially important
    if you do a lot of nested ssh'ing (I leave my localhost binding at `C-b`,
    but then TMUXESC=a on my next level, and maybe TMUXESC=x if I've got a
    third inside that.)
  - If you set the env var `$WANT_TMUX_TO_HAVE_ALT_PLUS_NUM` , then tmux will
    switch through windows with Alt-0, Alt-1, etc. This is my preference, but
    if you use some app that binds it it'd be annoying, so I defaulted it to
    off.
* vim stuff:
  - `.vim/plugin/1337-keys.vim` - Changes formatoptions to favor comments
    less.
  - `.vim/ftplugin/ruby_syntaxshortcuts.vim`
     * `\9` for converting to Ruby 1.9-style hash args
     * `\0` to kill parens
     * `\'` to switch to single quotes (this and the next needs to be
       available more generally)
     * '\"' to switch to single quotes
  - ctrlp-1337.vim - Pull in the *excellent*
    [CtrlP.vim](http://kien.github.com/ctrlp.vim/)
  - coffee-1337.vim - Auto-write `.js` from `.cs`, if you have a file in the
    current dir named `.compile-coffeescript-automatically`
  - delimitmate-addon.vim - Raimondi's awesome thing so you you don't have to
    type matching delimiters.
  - powerline. A more informative status bar. For super1337 mode try to get
    the font patches going.
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
