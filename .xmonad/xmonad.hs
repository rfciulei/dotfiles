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
import XMonad.Layout.NoBorders     

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
-- 2nd screen
import XMonad.Layout.IndependentScreens
import XMonad.Util.WorkspaceCompare

import XMonad.Actions.GridSelect

------------------------------------------------------------------------

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
	, ((modm .|. shiftMask, xK_t), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "rofi -show run")
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
	
    , ((modm , xK_f), spawn "pkill xmobar")
    
    -- close focused window
    , ((modm .|. shiftMask, xK_c), kill)

    -- Rotate through the available layout algorithms
    , ((modm, xK_space ), sendMessage NextLayout)

    -- Move focus 
    , ((modm, xK_Tab), windows W.focusDown)
    , ((modm .|. shiftMask, xK_Tab), windows W.focusUp)
  
   	-- Swap windows
	, ((modm .|. shiftMask, xK_j), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
	
	-- Shrink/Expand
	, ((modm, xK_h), sendMessage Shrink)
    , ((modm, xK_l), sendMessage Expand)

    -- Push window back into tiling
    , ((modm, xK_t), withFocused $ windows . W.sink)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm , xK_q), spawn "xmonad --recompile; xmonad --restart")
   ]
   
	-- screens & workspaces 
  ++
  [((m .|. modm, k), windows $ onCurrentScreen f i)
      | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_5]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++
  [
   ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
  	  | (key, sc) <- zip [xK_F1, xK_F2] [1,0]
  	  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
   ]

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
    , resource  =? "kdesktop"       --> doIgnore
	] 

------------------------------------------------------------------------

myLogHook h = dynamicLogWithPP
 def
  { 
    ppHidden = xmobarColor "#3db87d" "" 
    , ppHiddenNoWindows = xmobarColor "#666666" "" 
    , ppCurrent = wrap "  <fc=#3db4b8>[</fc><fc=#3db4b8>" "</fc><fc=#3db4b8>]</fc> "

	, ppOrder = \(ws:_:t:_) -> [ws] 
	, ppOutput = hPutStrLn h
    , ppTitle = xmobarColor "#b2ed00" ""
    , ppLayout          = id
	, ppWsSep = "  "
	, ppSort = withWindowSet $ \ws -> return $ flip marshallSort id . W.screen . W.current $ ws
		
  } >> updatePointer (0.60, 0.60) (0,0)

------------------------------------------------------------------------
myStartupHook = do 
    spawnOnce "nitrogen --restore & "
    spawnOnce "redshift &" -- night light
    spawnOnce "compton &"
    spawnOnce "gnome-terminal"
    spawnOnce "/home/roar/.xmonad/scripts/initrc.sh"
    spawnOnce "firefox https://docs.python.org/3.10/reference/introduction.html http://zesty.ca/cv.html https://cs107e.github.io/guides/binutils/"
    --running Java GUI programs in non-reparenting window managers 
    setWMName "LG3D"

------------------------------------------------------------------------

mySpacing = spacingRaw False             -- Only for >1 window
                       -- The bottom edge seems to look narrower than it is
                       (Border 2 2 2 2) -- Size of screen edge gaps
                       False             -- Enable screen edge gaps
                       (Border 2 2 2 2) -- Size of window gaps
                       False             -- Enable window gaps

------------------------------------------------------------------------
--
main = do 
	nScreens <- countScreens
	xmobarProc <- spawnPipe "xmobar -x 1 /home/roar/.xmonad/xmobar.hs"

	xmonad $ docks $ def {
		terminal           = "gnome-terminal",
		focusFollowsMouse  = True,
		clickJustFocuses   = False,
		borderWidth        = 1,
		modMask            = mod4Mask,

		workspaces = withScreens nScreens (["1", "2", "3", "4"]),

	  	normalBorderColor  = "#0A0E14" ,
	  	focusedBorderColor = "#3db4b8", -- #666666 

	  	keys               = myKeys,
	  	mouseBindings      = myMouseBindings, 

		layoutHook         = avoidStruts $ smartBorders (Tall 1 (3/100) (1/2)  ||| Full),

		manageHook         = myManageHook,
		handleEventHook    = mempty,
		logHook  	       = myLogHook xmobarProc, 
		startupHook        = myStartupHook
    }
