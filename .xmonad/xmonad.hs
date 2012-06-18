import XMonad

--- Note: This requires xmonad-contrib (on Gentoo, at least)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.NoBorders
import System.Process
import System.Exit

myLayout = ThreeCol 1 (3/100) (1/2) ||| ThreeColMid 1 (3/100) (1/2) ||| Full ||| noBorders (tabbed shrinkText defaultTheme) ||| Accordion

-- -- If xmodmap has, for example, mapped Caps_Lock to mod3, then use that:
-- myModMask = do retval <- system "xmodmap | grep '^mod3\\s*\\S*' >/dev/null"
--                if retval == ExitSuccess
--                  then mod3Mask
--                  else mod1Mask
myModMask = mod3Mask

main = xmonad defaultConfig
            { layoutHook = myLayout
            , modMask = myModMask
            , terminal = "LANG=en_US.utf8 urxvt" }
