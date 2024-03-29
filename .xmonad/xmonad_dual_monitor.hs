{-# OPTIONS_GHC -Wno-deprecations #-}

------------------------------------------------------------------------
---IMPORTS
------------------------------------------------------------------------


import XMonad
import XMonad.Config
import XMonad.Config.Desktop

import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.IndependentScreens
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle.Instances

import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.SetWMName
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeWindows

import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Util.NamedWindows
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare

import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Actions.GridSelect

import Graphics.X11.ExtraTypes.XF86

import System.IO
import Data.Monoid
import System.Exit
-- import System.Taffybar.Support.PagerHints

import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Hooks.DynamicLog
-- import qualified XMonad.DBus as D


------------------------------------------------------------------------
---CONFIG
------------------------------------------------------------------------
myModMask       = mod4Mask  -- Sets modkey to super/windows key
myTerminal      = "alacritty" --  default terminal
myEditor        = "emacs"  -- Sets default text editor

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 1  -- Sets border width for windows
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- border colors
myNormalBorderColor  = "#292d3e"
myFocusedBorderColor = "#bbc5ff"


------------------------------------------------------------------------
---AUTOSTART
------------------------------------------------------------------------
myStartupHook = do
        -- spawn "hs-notifications"
        spawn "archur -r 1920x1080 -fg \\#ECCCFF -bg \\#282a36 -ts 0.9 -o /home/tux/.random_wallpaper.png &" -- generate random arch wallpaper
        spawn "hsetroot -fill ~/.random_wallpaper.png &"
        -- spawn "hsetroot -fill ~/.semicolon_wallpaper.png \\#cf4f7f &"  -- semicolon wallpaper
        -- spawn "hsetroot -fill ~/.wallpaper.jpg -tint \\#5f4e6e &"  -- i love linux wallpaper
        spawn "xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1 &"
        spawn "ibus-daemon &"
        spawn "owncloud &"
        spawn "pgrep redshift || redshift -l 50.70:7.09 -t 6000:3500 -m randr &"
        -- spawn "~/.dual_monitor.sh"
        -- spawn "stalonetray &"
        -- spawn "shutdown -P 22:30 &"
        setWMName "LG3D"


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
---KEYBINDINGS
------------------------------------------------------------------------
-- myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)

    -- launch firefox
    , ((modm,               xK_w     ), spawn "firefox")

    -- lock screen 
    , ((modm .|. shiftMask, xK_x     ), spawn "i3lock -n -f -i ~/.lock.png & systemctl suspend")

    -- shutdown 
    , ((modm .|. shiftMask, xK_g     ), spawn "shutdown now")

    -- launch emacs 
    , ((modm,               xK_e     ), spawn "emacs")

    -- launch filemanager - vifm
    -- , ((modm,               xK_f     ), spawn "termite -e vifm")

    -- launch filemanager - rofi file browser
    -- available on github
    -- https://github.com/marvinkreis/rofi-file-browser-extended
    -- , ((modm,               xK_f     ), spawn "rofi -show file-browser")

    -- launch network manager - using rofi-dmenu
    -- , ((modm,               xK_n     ), spawn "networkmanager_dmenu \
    --     	                              \ -lines 1 -line-margin 0 -line-padding 1 \
    --     	                              \ -separator-style none -font \"mono 11\" -columns 12 -bw 0 \
    --     	                              \ -hide-scrollbar")
    -- launch network manager - using standard dmenu
    , ((modm,               xK_n     ), spawn "networkmanager_dmenu -fn 'UbuntuMono Nerd Font:size=14' -nb '#282A36' -nf '#F8F8F2' -sb '#BD93F9' -sf '#282A36' -l 15 -p 'networkmanager:'")

    -- launch rofi
    -- , ((modm .|. shiftMask, xK_p     ), spawn "rofi -show run -modi run \
    --     	                              \ -lines 1 -line-margin 0 -line-padding 1 \
    --     	                              \ -separator-style none -font \"mono 11\" -columns 12 -bw 0 \
    --     	                              \ -hide-scrollbar")
    , ((modm,               xK_p     ), spawn "dmenu_run -fn 'UbuntuMono Nerd Font:size=14' -nb '#282A36' -nf '#F8F8F2' -sb '#BD93F9' -sf '#282A36' -l 15 -p 'dmenu:'")
    -- launch filemanager - dmenufm
    -- , ((modm,               xK_f     ), spawn "dmenufm")

    -- launch rofi
    -- , ((modm,               xK_p     ), spawn "rofi -modi window,run,ssh,combi -show run")

    -- lauch dmenu-extended
    -- , ((modm,               xK_p     ), spawn "dmenu_extended_run")

    -- launch rofi-pass
    , ((modm .|. shiftMask, xK_u     ), spawn "rofi-pass")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

    -- Grid Select
--    , ((modm,               xK_g     ), goToSelected defaultGSConfig)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm .|. shiftMask, xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    --, ((modm,               xK_m     ), windows W.focusMaster  )
    -- , ((modm,               xK_m     ), withFocused minimizeWindow)
    -- , ((modm .|. shiftMask, xK_m     ), sendMessage RestoreNextMinimizedWin)

    -- Maximize selected window
    -- , ((modm, .|. shiftMask, xK_f     ), (sendMessage $ Toggle FULL))

    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)

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

    -- Decrement the number of windows in the master area
    , ((modm .|. shiftMask, xK_comma), sendMessage (IncMasterN (-1)))

    -- Switch workspaces and screens
    , ((modm,               xK_Right),  moveTo Next (WSIs hiddenNotNSP))
    , ((modm,               xK_Left),   moveTo Prev (WSIs hiddenNotNSP))
    , ((modm .|. shiftMask, xK_Right),  shiftTo Next (WSIs hiddenNotNSP))
    , ((modm .|. shiftMask, xK_Left),   shiftTo Prev (WSIs hiddenNotNSP))
    , ((modm,               xK_Down),   nextScreen)
    , ((modm,               xK_Up),     prevScreen)
    , ((modm .|. shiftMask, xK_Down),   shiftNextScreen)
    , ((modm .|. shiftMask, xK_Up),     shiftPrevScreen)
    , ((0, xF86XK_MonBrightnessUp),     spawn "brightnessctl s +15")
    , ((0, xF86XK_MonBrightnessDown),   spawn "brightnessctl s 15-")
    , ((0, xF86XK_AudioRaiseVolume),    spawn "pamixer -i 5")
    , ((0, xF86XK_AudioLowerVolume),    spawn "pamixer -d 5")
    , ((0, xF86XK_AudioMute),           spawn "pamixer -t")
    , ((0, xK_Print),                   spawn "flameshot gui")


    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_r     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
   [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
     | (key, sc) <- zip [xK_a, xK_d] [1, 0]
     , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


hiddenNotNSP :: X (WindowSpace -> Bool)
hiddenNotNSP = do
  hs <- gets $ map W.tag . W.hidden . windowset
  return (\w -> (W.tag w) /= "NSP" && (W.tag w) `elem` hs)


-- addKeys = [ 
          -- ("<XF86AudioMute>",   spawn "pamixer -t")
          -- , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
          -- , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")
          -- , ("<XF86MonBrightnessDown>", spawn "brightnessctl s 15-")
          -- , ("<XF86MonBrightnessUp>", spawn "brightnessctl s +15")
          -- , ("<Print>",           spawn "flameshot gui")
--           ]

------------------------------------------------------------------------
---WORKSPACES
------------------------------------------------------------------------
        
-- myWorkspaces = ["一", "二", "三", "四", "五", "六", "七", "八", "九"]
-- myWorkspaces = ["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "κ" ]

myWorkspaces = withScreens 2 ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  
data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)

-- instance UrgencyHook LibNotifyUrgencyHook where
--     urgencyHook LibNotifyUrgencyHook w = do
--         name     <- getName w
--         Just idx <- fmap (W.findTag w) $ gets windowset

--         safeSpawn "notify-send" [show name, "workspace " ++ idx]

-- myWorkspaces = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

-- myManageHook = manageDocks <+> manageHook defaultConfig

myManageHook = composeAll $ [
  -- isNotification --> doIgnore
  -- className =? "Emacs"               --> doF (W.shift "0_1")
  -- , className =? "nomacs"            --> doF (W.shift "β") -- image viewer, currently does not work :(
  -- className =? "qpdfview"          --> doF (W.shift "0_3")
  className =? "org.pwmt.zathura"  --> doF (W.shift "0_3")
  -- , className =? "firefox"           --> doF (W.shift "0_4")
  -- , className =? "qutebrowser"       --> doF (W.shift "0_0")
  , className =? "discord"           --> doF (W.shift "0_5")
  , className =? "Thunderbird"       --> doF (W.shift "0_5")
  -- , className =? "Telegram"          --> doF (W.shift "0_5") -- currently does not work :(
  , className =? "Signal"            --> doF (W.shift "0_5")
  , isFullscreen                     --> doFloat
  ]
--  where
--    isNotification :: Query Bool
--    isNotification =
--      isInProperty "_NET_WM_WINDOW_TYPE" "_NET_WM_WINDOW_TYPE_NOTIFICATION"
--      shiftAndView :: ScreenId -> WorkspaceId -> ManageHook
--    shiftAndView s t =
--      doF $ viewOnScreen s (marshall s t) . W.shift (marshall s t)

------------------------------------------------------------------------
---LAYOUTS
------------------------------------------------------------------------
myLayout =  avoidStruts
            -- $ smartBorders
            $ layoutHook defaultConfig
--             $ minimize (mkToggle (NOBORDERS ?? FULL ?? EOT) (tiled ||| Mirror tiled ||| Full))
   -- where
     -- default tiling algorithm partitions the screen into two panes
     -- tiled   = spacing 0 $ Tall nmaster delta ratio

     -- The default number of windows in the master pane
       -- nmaster = 1

     -- Default proportion of screen occupied by master pane
       -- ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
       -- delta = 3/100




------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
myConfig xmproc = (defaults xmproc) -- `additionalKeysP` -- addKeys

myLogHook xmproc = dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc x
                        , ppCurrent = xmobarColor "#FFF370" "" . wrap "[" "]" -- Current workspace in xmobar
                        , ppVisible = xmobarColor "#c3e88d" ""                -- Visible but not current workspace
                        -- , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""   -- Hidden workspaces in xmobar
                        -- , ppHiddenNoWindows = xmobarColor "#F07178" ""        -- Hidden workspaces (no windows)
                        , ppTitle = xmobarColor "#F8F8F2" "" . shorten 40     -- Title of active window in xmobar
                        , ppSep =  "<fc=#9AEDFE> : </fc>"                     -- Separators in xmobar
                        , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"  -- Urgent workspace
                        , ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        }

    -- Override the PP values as you would like (see XMonad.Hooks.DynamicLog documentation)
--    myLogHook :: D.Client -> PP
--    myLogHook dbus = def { ppOutput = D.send dbus }

-- No need to modify this.

-- main :: IO()
main = do
    -- Connect to DBus
    -- dbus <- D.connect
    -- Request access (needed when sending messages)
    -- D.requestAccess dbus
    xmproc <- spawnPipe $ "xmobar ~/.xmonad/xmobarrc" -- xmobar
    xmonad
      $ ewmh $ docks $ myConfig xmproc

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs

defaults xmproc = def {
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
      -- mouseBindings      = myMouseBindings,

      -- hooks, layouts
        manageHook         = myManageHook,
        layoutHook         = myLayout,
        handleEventHook    = myEventHook,
        logHook            = myLogHook xmproc,
        startupHook        = myStartupHook
}

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Enter        Launch termite",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch rofi",
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
    "mod-r        Restart xmonad",
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
