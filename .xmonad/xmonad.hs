import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import Data.Ratio

myWorkspaces = ["main", "web", "im", "4", "5", "6", "7", "8", "9"]

basicLayout = Tall nmaster delta ratio where
    nmaster = 1
    delta   = 3/100
    ratio   = 1/2
tallLayout = named "tall" $ avoidStruts $ basicLayout
wideLayout = named "wide" $ avoidStruts $ Mirror basicLayout
singleLayout = named "single" $ avoidStruts $ noBorders Full
fullscreenLayout = named "fullscreen" $ noBorders Full
imLayout = avoidStruts $ reflectHoriz $ withIM ratio roster chatLayout where
    ratio      = 1%6
    roster     = (Role "buddy_list")
    chatLayout = Grid

myLayoutHook = fullscreen $ im $ normal where
    normal      = tallLayout ||| wideLayout ||| singleLayout
    fullscreen  = onWorkspace "web" fullscreenLayout
    im          = onWorkspace "im" imLayout

myStatusBar = "dzen2 -w 1680 -ta l -fg '#DCDCCC' -bg '#3f3f3f'"

myDzenPP h = defaultPP {
  ppOutput = hPutStrLn h
  , ppCurrent  = dzenColor "white" "#2b4f98" . pad
  , ppVisible  = dzenColor "black" "#999999" . pad
  , ppHidden   = dzenColor "black" "#cccccc" . pad
  , ppHiddenNoWindows = const ""
  , ppUrgent   = dzenColor "red" "yellow" . dzenStrip
  , ppWsSep    = ""
  , ppSep      = ""
  , ppLayout   = dzenColor "black" "#cccccc" .
                 (\ x -> case x of
                           "TilePrime Horizontal" -> " TTT "
                           "TilePrime Vertical"   -> " []= "
                           "Hinted Full"          -> " [ ] "
                           _                      -> pad x
                 )
  , ppTitle    = ("^bg(#324c80) " ++) . dzenEscape
  }

myModMask = mod4Mask

myManageHook = composeAll
  [ className =? "Pidgin"             --> doShift "im"
    , className =? "Chromium"             --> doShift "web"
  ]

main = do
    myStatusBarPipe <- spawnPipe myStatusBar
    xmonad $ withUrgencyHook NoUrgencyHook
           $ defaultConfig
        { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , modMask = myModMask     -- Rebind Mod to the Windows key
	, terminal = "urxvtc"
	, workspaces = myWorkspaces
	, logHook = dynamicLogWithPP $ myDzenPP myStatusBarPipe
	, layoutHook = avoidStruts $ myLayoutHook
        } `additionalKeys`
        [ ((myModMask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
        , ((myModMask                     , xK_BackSpace), focusUrgent)
        ]
