import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import Data.Monoid
import System.IO
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal      = "kitty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 0  -- width of window border in pixels

myModMask       = mod4Mask -- "Windows" Key. 

-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["\xf120 ","\xf268 ","3","4","\xf269 ","\xf198 ","7","8","9"]
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff0000"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)  -- launch a terminal
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")  -- launch gmrun
    , ((modm .|. shiftMask, xK_c     ), kill)  -- close focused window
    , ((modm,               xK_space ), sendMessage NextLayout)  -- Rotate through the available layout algorithms
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)  --  Reset the layouts on the current workspace to default
    , ((modm,               xK_n     ), refresh)  -- Resize viewed windows to the correct size
    , ((modm,               xK_Tab   ), windows W.focusDown)  -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)  -- Move focus to the next window
    , ((modm,               xK_k     ), windows W.focusUp  )  -- Move focus to the previous window
    , ((modm,               xK_m     ), windows W.focusMaster  )  -- Move focus to the master window
    , ((modm,               xK_Return), windows W.swapMaster)  -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )  -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )  -- Swap the focused window with the previous window
    , ((modm,               xK_h     ), sendMessage Shrink)  -- Shrink the master area
    , ((modm,               xK_l     ), sendMessage Expand)  -- Expand the master area
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)  -- Push window back into tiling
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))  -- Increment the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))  -- Deincrement the number of windows in the master area
    , ((modm              , xK_b     ), sendMessage ToggleStruts)  -- Toggle xmobar display
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))  -- Quit xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")  -- Restart xmonad
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))  -- Run xmessage with a summary of the default keybindings (useful for beginners)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
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

myLayout = smartSpacing 5 $ avoidStruts (Full ||| tiled ||| Mirror tiled ||| threeCol)
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- The default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ 
        className =? "MPlayer"             --> doFloat
      , className =? "Gimp"                --> doFloat
      , resource  =? "desktop_window"      --> doIgnore
      , resource  =? "kdesktop"            --> doIgnore
      , title     =? "Mozilla Firefox"     --> doShift ( myWorkspaces !! 4 )
      , className =? "Slack"               --> doShift ( myWorkspaces !! 5 )
      , className =? "Google-chrome"       --> doShift ( myWorkspaces !! 1 )
      , className =? "kitty"               --> doShift ( myWorkspaces !! 0 )
    ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ def { 
      ppOutput = hPutStrLn h 
    , ppCurrent = xmobarColor "#82AAFF" "" . wrap "(" ")" -- Current workspace
    , ppVisible = xmobarColor "#98be65" "" -- Visible but not current workspace
    , ppHidden = xmobarColor "#82AAFF" ""  -- Hidden workspace
    , ppHiddenNoWindows = xmobarColor "#ffffff" "" -- Hidden workspace
    , ppTitle = xmobarColor "#b3afc2" "" . shorten 60 -- Title of active window
    , ppSep = "<fc=#666666> • </fc>" -- Separators
    , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!" -- Urgent workspace
    , ppOrder = \(ws:_:t:ex) -> [ws] ++ ex ++ [t]
}

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    spawnOnce "nitrogen --restore &"
    spawnOnce "picom &"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
    h <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
    xmonad $ docks $ defaults {
        logHook = myLogHook h
    }

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--


defaults = def {
      -- simple stuff
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
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = return (),
        startupHook        = myStartupHook

    } `additionalKeysP`
    [ ("M-S-z", spawn "xscreensaver-command -lock")
    , ("M-S-=", unGrab *> spawn "scrot -s")
    , ("M-]", spawn "firefox")
    , ("M-S-<Return>" , spawn "dmenu_run"                                  )
    , ("M-p e", spawn "$HOME/.local/bin/config-open" )
    , ("M-<Return>"   , spawn (myTerminal) )
    ]

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
