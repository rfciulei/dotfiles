import XMonad
import Data.Monoid
import System.Exit
import XMonad.Util.SpawnOnce
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import System.IO
import XMonad.Util.EZConfig(additionalKeys)

import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders (smartBorders)

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- audio
import Graphics.X11.ExtraTypes.XF86

myTerminal      = "gnome-terminal"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 1
myModMask       = mod4Mask
myWorkspaces    = ["web","dev","3","4","5","6","7","8","9"]
myNormalBorderColor  = "#222222"
myFocusedBorderColor = "#7cac7a"
mySpacing = spacingRaw True             -- Only for >1 window
                       -- The bottom edge seems to look narrower than it is
                       (Border 0 12 8 8) -- Size of screen edge gaps
                       True             -- Enable screen edge gaps
                       (Border 4 4 4 4) -- Size of window gaps
                       True             -- Enable window gaps
------------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    -- launch dmenu
    , ((modm,               xK_p     ), spawn "dmenu_run")
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
    
	-- volume keys
    , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
    , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
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
myLogHook h = dynamicLogWithPP $ def
  { ppLayout = wrap "(<fc=#e4b63c>" "</fc>)"
  , ppTitleSanitize = const ""  -- Also about window's title
  , ppVisible = wrap "(" ")"  -- Non-focused (but still visible) screen
  , ppCurrent = wrap "  <fc=#b8473d>[</fc><fc=#7cac7a>" "</fc><fc=#b8473d>]</fc>  "-- Non-focused (but still visible) screen
  , ppOutput = hPutStrLn h
  }	
------------------------------------------------------------------------

myEventHook = mempty
------------------------------------------------------------------------
myStartupHook = do 
	spawnOnce "nitrogen --restore & "
	spawnOnce "compton &"
------------------------------------------------------------------------
main = do
	xmobarProc <- spawnPipe "xmobar -x 0 /home/roar/.xmonad/xmobar.hs"
	xmonad $ docks $ def {
	
	terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
      -- hooks, layouts
        layoutHook         = myLayout ,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
	logHook  	   = myLogHook xmobarProc, 
	startupHook        = myStartupHook
    }
