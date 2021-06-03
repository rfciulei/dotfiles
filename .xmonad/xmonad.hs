import System.IO
import System.Exit
---------------------------------
import XMonad
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Actions.UpdatePointer
---------------------------------
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
---------------------------------
import Graphics.X11.ExtraTypes.XF86
---------------------------------
-- correct display for java swing apps
import XMonad.Hooks.SetWMName
---------------------------------

myLayout = avoidStruts $ mySpacing $ smartBorders (tiled ||| Full ) 
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

------------------------------------------------------------------------

mySpacing = spacingRaw False             -- Only for >1 window
                       -- The bottom edge seems to look narrower than it is
                       (Border 8 8 8 8) -- Size of screen edge gaps
                       True             -- Enable screen edge gaps
                       (Border 4 4 4 4) -- Size of window gaps
                       True             -- Enable window gaps

------------------------------------------------------------------------

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "dmenu_run")
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
   
    --audio
    , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
    , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%") 
    --brightnessctl 
    , ((0, xF86XK_MonBrightnessUp), spawn "/home/roar/.xmonad/scripts/brightness.sh increase")
    , ((0, xF86XK_MonBrightnessDown), spawn "/home/roar/.xmonad/scripts/brightness.sh")
    
    , ((modm .|. shiftMask, xK_l), spawn "xtrlock")
    
    , ((0, xF86XK_TouchpadToggle), spawn "/home/roar/.xmonad/scripts/toggle_touchpad.sh")
    
    -- close focused window
    , ((modm .|. shiftMask, xK_c), kill)
    -- Rotate through the available layout algorithms
    , ((modm, xK_space ), sendMessage NextLayout)
    -- Move focus to the next window
    , ((modm, xK_Tab), windows W.focusDown)
    -- Move focus to the next window
    , ((modm, xK_j), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm, xK_k), windows W.focusUp)
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    -- shrink master 
    , ((modm, xK_h), sendMessage Shrink)
    , ((modm, xK_l), sendMessage Expand)
    -- Push window back into tiling
    , ((modm, xK_t), withFocused $ windows . W.sink)
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm , xK_q), spawn "xmonad --recompile; xmonad --restart")
   ]
   -- workspaces
    ++
    [((m .|. modm, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_5]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

------------------------------------------------------------------------

myManageHook = composeAll
    [ 
     resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------

myLogHook h = dynamicLogWithPP
 def
  { 
    --ppHidden = xmobarColor 7999775c" "" 
    ppHidden = xmobarColor "#7cac7a" "" 
    , ppHiddenNoWindows = xmobarColor "#666666" "" 
    , ppCurrent = wrap "  <fc=#b8473d>[</fc><fc=#7cac7a>" "</fc><fc=#b8473d>]</fc>  "
   -- ppHidden = xmobarColor "#c678dd" "" 
   -- , ppHiddenNoWindows = xmobarColor "#7cac7a" "" 
   -- , ppCurrent = wrap "  <fc=#b8473d>[</fc><fc=#c678dd>" "</fc><fc=#e1234f>]</fc>  "
    , ppOrder = \(ws:_:_:_) -> [ws]
    , ppOutput = hPutStrLn h
  } >> updatePointer (0.75, 0.75) (0,0)

------------------------------------------------------------------------
myStartupHook = do 
    spawnOnce "nitrogen --restore & "
    spawnOnce "compton &"
    spawnOnce "gnome-terminal"
    spawnOnce "/home/roar/.xmonad/scripts/initrc.sh"
    spawnOnce "brave-browser"
    
    --running Java GUI programs in non-reparenting window managers 
    setWMName "LG3D"
------------------------------------------------------------------------
main = do
	xmobarProc <- spawnPipe "xmobar -x 0 /home/roar/.xmonad/xmobar.hs"
	xmonad $ docks $ def {
		terminal           = "gnome-terminal",
		focusFollowsMouse  = True,
		clickJustFocuses   = False,
		borderWidth        = 1,
		modMask            = mod4Mask,
		workspaces         = ["web", "dev", "3", "4", "5"],
		normalBorderColor  = "#222232" ,
		focusedBorderColor = "#4B676C",
		keys               = myKeys,
		mouseBindings      = myMouseBindings, 
		layoutHook         = myLayout ,
		manageHook         = myManageHook,
		handleEventHook    = mempty,
		logHook  	       = myLogHook xmobarProc, 
		startupHook        = myStartupHook
    }
