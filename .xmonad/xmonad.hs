-- Docs: http://xmonad.org/xmonad-docs/frames.html
-- Exploring:- ghci ~/.xmonad/xmonad.hs

import XMonad

--- Note: These require xmonad-contrib
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig

import qualified Data.Map as M
import qualified XMonad.StackSet as W

keysForAltFn =
  [ ((mod1Mask, xK_F5 ), spawn "~/bin/Alt+F5")
  , ((mod1Mask, xK_F9 ), spawn "~/bin/Alt+F9") ]

keysToBeLikeOSX =
  [ ("M-x", spawn "notify-send woohoo")
  ]


keyToLockScreen = [ ("C-M-l", spawn "~/bin/,lock" ) ]

keysToMoveWindowAndSwitchWorkspaces =
        [ ("M-"++m++show k, f i)
        | (i, k) <- zip myWorkspaces ([1 .. 9]++[0])
        , (f, m) <-
            [(windows . W.greedyView, ""),
             (\i -> windows (W.shift i) >> windows (W.greedyView i), "S-")]
        ]

myWorkspaces = [
    "1:dev","2:web","3:chat","4:mail","5:voip",
    "6:misc","7:misc2","8:dev2","9:misc3","0","-","=" ]

myLayout = ThreeCol 1 (3/100) (1/2) ||| Full

-- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Actions-TopicSpace.html
-- TODO: import XMonad.Actions.TopicSpace

main = do
    xmonad $ defaultConfig
        { modMask = mod4Mask
        , terminal = myTerminal
        , layoutHook = myLayout
        , normalBorderColor  = "black"
        , focusedBorderColor = "green"
        , borderWidth = 2
        }
        -- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Util-EZConfig.html
        -- and:
        -- http://hackage.haskell.org/packages/archive/X11/latest/doc/html/Graphics-X11-Types.html
        `additionalKeys`
        (keysForAltFn)
        `additionalKeysP`
        (keyToLockScreen ++ keysToBeLikeOSX ++ keysToMoveWindowAndSwitchWorkspaces)

myTerminal = "LANG=en_US.utf8 urxvt"

-- -
-- -
-- -import System.Process
-- -import System.Exit
-- -import System.Posix.Signals
-- -
-- -import XMonad.Prompt
-- -
-- --- If xmodmap has, for example, mapped Caps_Lock to mod3, then use that:
-- -determineModMask = do
-- -    r <- system "xmodmap | grep '^mod3\\s*\\S' >/dev/null"
-- -    return (if r == ExitSuccess then mod3Mask else mod1Mask)
-- -
-- -
-- --- from https://github.com/sharpsaw/x-dots/blob/master/bin/%2Clock
-- -keyToLockScreen = [ ("C-M-l", spawn "~/bin/,lock" ) ]
-- -
-- -keysForAltFn =
-- -  [ ((mod1Mask, xK_F5 ), spawn "~/bin/Alt+F5")
-- -  , ((mod1Mask, xK_F9 ), spawn "~/bin/Alt+F9") ]
-- -
--  main = do
-- -    installHandler processStatusChanged Default Nothing
-- -    myModMask <- determineModMask
--      xmonad $ defaultConfig
-- -        { workspaces = myWorkspaces
-- -        , layoutHook = myLayout
-- -        , manageHook = myManageHook <+> manageHook defaultConfig
-- -        , modMask = myModMask
-- +        { modMask = mod4Mask
--          , terminal = myTerminal
--          , normalBorderColor  = "black"
--          , focusedBorderColor = "green"
--          , borderWidth = 1
--          }
-- -        -- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Util-EZConfig.html
-- -        -- and:
-- -        -- http://hackage.haskell.org/packages/archive/X11/latest/doc/html/Graphics-X11-Types.html
-- -        `additionalKeys`
-- -        keysForAltFn
-- -        `additionalKeysP`
-- -        (keyToLockScreen ++ keysToMoveWindowAndSwitchWorkspaces)
-- -
-- -myWorkspaces = [
-- -    "1:dev","2:web","3:irc","4:skype","5:misc",
-- -    "6:emu","7:chrome","8:ie8","9","0","-","="]
-- -
-- -myManageHook = composeAll
-- -    [ className =? "Mumble" --> doFloat
-- -    , className =? "Pentadactyl" --> doShift "2:web" -- not matching
-- -    , className =? "Skype" --> doShift "4:skype"
-- -    ]
-- -
-- -myLayout = ThreeCol 1 (3/100) (1/2) ||| Full
--  
-- --- TODO: Also make this conditional (on there being a working urxvt.)
--  myTerminal = "LANG=en_US.utf8 urxvt"
