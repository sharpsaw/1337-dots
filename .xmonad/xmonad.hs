-- Docs: http://xmonad.org/xmonad-docs/frames.html
-- Exploring:- ghci ~/.xmonad/xmonad.hs

import XMonad

-- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Actions-TopicSpace.html
-- TODO: import XMonad.Actions.TopicSpace

-- Note: These require xmonad-contrib
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig

import qualified Data.Map as M

import System.Process
import System.Exit
import System.Posix.Signals

import XMonad.Prompt

-- If xmodmap has, for example, mapped Caps_Lock to mod3, then use that:
-- Needs another approach:
-- http://hackage.haskell.org/packages/archive/X11/latest/doc/html/Graphics-X11-Xlib-Extras.html#v:getModifierMappi
determineModMask = do
    r <- system "xmodmap | grep '^mod3\\s*\\S' >/dev/null"
    return (if r == ExitSuccess then mod3Mask else mod1Mask)

main = do
    installHandler processStatusChanged Default Nothing
    myModMask <- determineModMask
    print mod3Mask
    print mod1Mask
    print myModMask -- TODO: see what this picks when mod3's not selected
    xmonad $ defaultConfig
        { workspaces = myWorkspaces
        , layoutHook = myLayout
        , manageHook = myManageHook <+> manageHook defaultConfig
        , modMask = myModMask
        , terminal = myTerminal
        , normalBorderColor  = "black"
        , focusedBorderColor = "green"
        , borderWidth = 1
        }
        -- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Util-EZConfig.html
        -- and:
        -- http://hackage.haskell.org/packages/archive/X11/latest/doc/html/Graphics-X11-Types.html
        `additionalKeys`
        [ ((mod1Mask, xK_F5 ), spawn "~/bin/Alt+F5")
        , ((mod1Mask, xK_F9 ), spawn "~/bin/Alt+F9")
        ]
        `additionalKeysP`
        [ ("C-M-l", spawn "~/bin/,lock" ) -- from https://github.com/sharpsaw/x-dots/blob/master/bin/%2Clock
        ]

myWorkspaces = [
    "1:dev","2:web","3:irc","4:skype","5:misc",
    "6:emu","7:chrome","8:ie8","9","0","-","="]

myManageHook = composeAll
    [ className =? "Mumble" --> doFloat
    , className =? "Pentadactyl" --> doShift "2:web" -- not matching
    , className =? "Skype" --> doShift "4:skype"
    ]

myLayout = ThreeCol 1 (3/100) (1/2) ||| Full

-- TODO: Also make this conditional (on there being a working urxvt.)
myTerminal = "LANG=en_US.utf8 urxvt"
