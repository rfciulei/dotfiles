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
-- support for dual monitors
import XMonad.Layout.IndependentScreens
import XMonad.Actions.UpdatePointer
---------------------------------
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
---------------------------------
-- audio
import Graphics.X11.ExtraTypes.XF86
import Data.Monoid

-- correct display for java swing apps
import XMonad.Hooks.SetWMName

myTerminal      = "gnome-terminal"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False
myBorderWidth   = 1
myModMask       = mod4Mask
myNormalBorderColor  = "#222232"
--myFocusedBorderColor = "#7cac7a"
myFocusedBorderColor =  "#4B676C"
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
    
	, ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
    , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
	
	, ((0, xF86XK_TouchpadToggle), spawn "~/./toggle_touchpad.sh")
   
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
   -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    -- Shrink the master area
    , ((modm, xK_h), sendMessage Shrink)
    -- Expand the master area
    , ((modm, xK_l), sendMessage Expand)
    -- Push window back into tiling
    , ((modm, xK_t), withFocused $ windows . W.sink)
   -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm , xK_q), spawn "xmonad --recompile; xmonad --restart")
    -- Screen Lock
    , ((modm .|. shiftMask, xK_l), spawn "xtrlock")
   ]
   -- workspaces
	++
	[((m .|. modm, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
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
-- Layouts:
myLayout = avoidStruts $ mySpacing $ smartBorders (tiled ||| Full ) 
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100
------------------------------------------------------------------------
myManageHook = composeAll
    [ resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]
------------------------------------------------------------------------
--myLogHook h = dynamicLogWithPP
-- def
--  {   
--	ppCurrent = wrap "  <fc=#b8473d>[</fc><fc=#7cac7a>" "</fc><fc=#b8473d>]</fc>  " 
--	, ppOutput = hPutStrLn h
--	, ppOrder = \(ws:_:_:_) -> [ws]
--	, ppHidden = xmobarColor "#82AAFF" "" 
--	, ppSort = withWindowSet $ \ws -> return $ flip marshallSort id . W.screen . W.current $ ws
--	--,ppLayout = wrap "(<fc=#e4b63c>"  "</fc>)"
--	--,ppHiddenNoWindows = xmobarColor "lightgray" ""  
--  } >> updatePointer (0.75, 0.75) (0,0)

myLogHook h = dynamicLogWithPP
 def
  { 
  	-- ppTitleSanitize = const ""  -- Also about window's title
	 ppHidden = xmobarColor "#c678dd" "" 
	, ppHiddenNoWindows = xmobarColor "#7cac7a" "" 
	, ppOrder = \(ws:_:_:_) -> [ws]
	, ppCurrent = wrap "  <fc=#b8473d>[</fc><fc=#7cac7a>" "</fc><fc=#e1234f>]</fc>  "
	, ppOutput = hPutStrLn h
  } >> updatePointer (0.75, 0.75) (0,0)

------------------------------------------------------------------------
myEventHook = mempty
------------------------------------------------------------------------
myStartupHook = do 
	spawnOnce "nitrogen --restore & "
	spawnOnce "compton &"
	spawnOnce "gnome-terminal"
	spawnOnce "firefox"
------------------------------------------------------------------------
main = do
	nScreens <- countScreens
	xmobarProc <- spawnPipe "xmobar -x 0 /home/roar/.xmonad/xmobar.hs"
	xmonad $ docks $ def {
		terminal           = myTerminal,
		focusFollowsMouse  = myFocusFollowsMouse,
		clickJustFocuses   = myClickJustFocuses,
		borderWidth        = myBorderWidth,
		modMask            = myModMask,
--		workspaces         = withScreens 2  (map show [1..4]),
		workspaces         = ["web", "dev", "3", "4", "5", "6", "7", "8","9"],
		normalBorderColor  = myNormalBorderColor,
		focusedBorderColor = myFocusedBorderColor,
		keys               = myKeys,
		mouseBindings      = myMouseBindings, -- hooks, layouts
		layoutHook         = myLayout ,
		manageHook         = myManageHook,
		handleEventHook    = myEventHook,
		logHook  	   = myLogHook xmobarProc, 
--		startupHook        = setWMName "LG3D"
		startupHook        = myStartupHook
    }
