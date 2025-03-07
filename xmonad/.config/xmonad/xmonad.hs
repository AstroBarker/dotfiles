import XMonad

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops

-- Util
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import XMonad.Util.Loggers

-- Layout
import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Renamed
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

-- Actions
import XMonad.Actions.GroupNavigation

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

myConfig = def
    { modMask     = mod4Mask                          -- Rebind Mod to the Super key
    , layoutHook  = spacingWithEdge 5 $ myLayout      -- Use custom layouts
    , manageHook  = myManageHook                      -- Match on certain windows
    , terminal    = myTerminal                        -- term
    , startupHook = myStartupHook                     -- starup things
    , focusedBorderColor = "#458588"
    , normalBorderColor  = "#665c54"
    }
  `additionalKeysP`
    [ ("M-S-z", spawn "xscreensaver-command -lock")
    , ("M-C-s", unGrab *> spawn "scrot -s"        )
    , ("M-f"  , spawn "librewolf"                   )
    , ("M-d"  , spawn "rofi -show run"                   )
--    , ((modm              , xK_t), nextMatch Forward  (className =? "XTerm"))
--    , ((modm .|. shiftMask, xK_t), nextMatch Backward (className =? "XTerm"))
    ]

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , isDialog            --> doFloat
    ]

-- layouts --
myLayout = tiled ||| Mirror tiled ||| noBorders Full ||| emptyBSP ||| threeCol
  where
    threeCol
        = renamed [Replace "ThreeCol"]
        $ magnifiercz' 1.3
        $ ThreeColMid nmaster delta ratio
    tiled   = Tall nmaster delta ratio
    nmaster = 1      -- Default number of windows in the master pane
    ratio   = 1/2    -- Default proportion of screen occupied by master pane
    delta   = 3/100  -- Percent of screen to increment by when resizing panes

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#d3869b" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

myTerminal = "kitty"

myStartupHook :: X ()
myStartupHook = do
--  spawnOnce "trayer --edge top --align right --SetDockType true \
--            \--SetPartialStrut true --expand true --width 10 \
--            \--transparent true --tint 0x5f5f5f --height 18"
  spawnOnce "feh --bg-fill --no-fehbg ~/pictures/wallpapers/outer_wilds.jpg"
