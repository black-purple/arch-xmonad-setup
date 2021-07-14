import XMonad.Actions.Plane
import XMonad.Actions.Promote
import XMonad.Util.Dzen


    -- Base
import XMonad
import System.Directory
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Actions
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (Direction1D(..), moveTo, shiftTo, WSType(..), nextScreen, prevScreen)
import XMonad.Actions.GridSelect
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll, killAll)
import qualified XMonad.Actions.Search as S

    -- Data
import Data.Char (isSpace, toUpper)
import Data.Maybe (fromJust)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import qualified Data.Map as M

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory

    -- Layouts
import XMonad.Layout.Accordion
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed

    -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.Magnifier
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ShowWName
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

   -- Utilities
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

myFont :: String
myFont = "xft:Ubuntu:regular:size=9:antialias=true:hinting=true"

myEmojiFont :: String
myEmojiFont = "xft:JoyPixels:regular:size=9:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask        -- Sets modkey to super/windows key

myTerminal :: String
myTerminal = "kitty" -- Sets default terminal

myBrowser :: String
myBrowser = "brave"  -- Sets firefox as browser

myEditor :: String
myEditor = myTerminal ++ " -e nvim "    -- Sets vim as editor

myBorderWidth :: Dimension
myBorderWidth = 2           -- Sets border width for windows

myNormColor :: String
myNormColor   = "#281c34"   -- Border color of normal windows

myFocusColor :: String
myFocusColor  = "#686de0"   -- Border color of focused windows

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "picom &"
    spawnOnce "nitrogen --restore &"
    spawnOnce "nm-applet &"
    spawnOnce "volumeicon &"
    spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 0 --tint 0x282c34 --height 22 &"
    setWMName "LG3D"
    spawnOnce "conky -c $HOME/.config/conky/Enif/Enif.conf &> /dev/null &"
    spawnOnce "blueman-adapters &"
    spawnOnce "copyq &"

myColorizer :: Window -> Bool -> X (String, String)
myColorizer = colorRangeFromClassName
                  (0x28,0x2c,0x34) -- lowest inactive bg
                  (0x28,0x2c,0x34) -- highest inactive bg
                  (0xc7,0x92,0xea) -- active bg
                  (0xc0,0xa7,0x9a) -- inactive fg
                  (0x28,0x2c,0x34) -- active fg

-- gridSelect menu layout
mygridConfig :: p -> GSConfig Window
mygridConfig colorizer = (buildDefaultGSConfig myColorizer)
    { gs_cellheight   = 40
    , gs_cellwidth    = 200
    , gs_cellpadding  = 6
    , gs_originFractX = 0.5
    , gs_originFractY = 0.5
    , gs_font         = myFont
    }

spawnSelected' :: [(String, String)] -> X ()
spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
    where conf = def
                   { gs_cellheight   = 40
                   , gs_cellwidth    = 200
                   , gs_cellpadding  = 6
                   , gs_originFractX = 0.5
                   , gs_originFractY = 0.5
                   , gs_font         = myFont
                   }

myAppGrid = [ ("Telegram-desktop", "telegram-desktop")
                 , ("VScode", "code-insiders")
                 , ("Godot", "godot")
                 , ("Firefox", "firefox")
                 , ("VirtualBox", "virtualbox")
                 , ("Kdenlive", "kdenlive")
                 , ("WPS Writer", "wps")
                 , ("WPS Sheets", "et")
                 , ("WPS Presentation", "wpp")
                 , ("OBS", "obs")
                 , ("GitHub Desktop", "github-desktop")
                 , ("Control Center", "systemsettings5") -- this on kde plasma 5 it could have a different command on another DE
                 , ("Firefox Dev", "firefox-bin")
                 ]

--Makes setting the spacingRaw simpler to write. The spacingRaw module adds a configurable amount of space around windows.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Defining layouts
-- limitWindows n sets maximum number of windows displayed for layout.
-- mySpacing n sets the gap size around the windows.
tall     = renamed [Replace "tall"]
           $ smartBorders
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ limitWindows 12
           $ mySpacing 4 
           $ ResizableTall 1 (3/100) (1/2) []
tabs     = renamed [Replace "tabs"]
           -- I won't add spacing to this layout because it will
           -- add spacing between window and tabs which looks bad.
           $ tabbed shrinkText myTabTheme

-- setting colors for tabs layout and tabs sublayout.
myTabTheme = def { fontName            = myFont
                 , activeColor         = "#46d9ff"
                 , inactiveColor       = "#313846"
                 , activeBorderColor   = "#46d9ff"
                 , inactiveBorderColor = "#282c34"
                 , activeTextColor     = "#282c34"
                 , inactiveTextColor   = "#d0d0d0"
                 }

-- Theme for showWName which prints current workspace when you change workspaces.
myShowWNameTheme :: SWNConfig
myShowWNameTheme = def
    { swn_font              = "xft:Ubuntu:bold:size=60"
    , swn_fade              = 1.0
    , swn_bgcolor           = "#1c1f24"
    , swn_color             = "#ffffff"
    }

-- The layout hook
myLayoutHook = avoidStruts $ mouseResize $ windowArrange  $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
             where
               myDefaultLayout = withBorder myBorderWidth tall ||| noBorders tabs


-- myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 "]
myWorkspaces = [" web ", " code ", " chat ", " sys ", " vid ", " office ", " cgi "]
-- myWorkspaces = [" one ", " two ", " three ", " four ", " five ", " six ", " seven "]

myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..] -- (,) == \x y -> (x,y)

clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
    where i = fromJust $ M.lookup ws myWorkspaceIndices

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     -- 'doFloat' forces a window to float.  Useful for dialog boxes and such.
     -- using 'doShift ( myWorkspaces !! 0)' sends program to workspace 1!
     -- I'm doing it this way because otherwise I would have to write out the full
     -- name of my workspaces and the names would be very long if using clickable workspaces.
     [ 
       className =? "confirm"                       --> doFloat
     , className =? "file_progress"                 --> doFloat
     , className =? "dialog"                        --> doFloat
     , className =? "download"                      --> doFloat
     , className =? "error"                         --> doFloat
     , className =? "notification"                  --> doFloat
     , className =? "pinentry-gtk-2"                --> doFloat
     , className =? "splash"                        --> doFloat
     , className =? "toolbar"                       --> doFloat
     , title =? "Oracle VM VirtualBox Manager"      --> doFloat

  -- Specific apps to appropriate workspace
     -- browsers
     , className =? "firefox"                       --> doShift ( myWorkspaces !! 0 )
     , className =? "qutebrowser"                   --> doShift ( myWorkspaces !! 0 )
     , className =? "Chromium"                      --> doShift ( myWorkspaces !! 0 )
     , className =? "Firefox Developer Edition"     --> doShift ( myWorkspaces !! 0 )
     , className =? "Brave-browser"                 --> doShift ( myWorkspaces !! 0 )
     -- code editors
     , className =? "Code"                          --> doShift ( myWorkspaces !! 1 )
     , className =? "Code - Insiders"               --> doShift ( myWorkspaces !! 1 )
     , className =? "kate"                          --> doShift ( myWorkspaces !! 1 )
     , className =? "Godot"                         --> doShift ( myWorkspaces !! 1 )
     , className =? "GitHub Desktop"                --> doShift ( myWorkspaces !! 1 )

     -- chat apps
     , className =? "TelegramDesktop"               --> doShift ( myWorkspaces !! 2 )
     , className =? "Signal"                        --> doShift ( myWorkspaces !! 2 )
     , className =? "discord"                       --> doShift ( myWorkspaces !! 2 )
     , className =? "lighcord"                      --> doShift ( myWorkspaces !! 2 )

     -- system apps
     , className =? "systemsettings"                --> doShift ( myWorkspaces !! 3 )
     , className =? "dolphin"                       --> doShift ( myWorkspaces !! 3 )
     , className =? "Gucharmap"                     --> doShift ( myWorkspaces !! 3 )

     -- multimedia apps
     , className =? "mpv"                           --> doShift ( myWorkspaces !! 4 )
     , className =? "vlc"                           --> doShift ( myWorkspaces !! 4 )

     -- office and virtualboxes
     , className =? "VirtualBox Manager"            --> doShift ( myWorkspaces !! 5 )
     , className =? "Wps"                           --> doShift ( myWorkspaces !! 5 )
     , className =? "Wpp"                           --> doShift ( myWorkspaces !! 5 )
     , className =? "Et"                            --> doShift ( myWorkspaces !! 5 )
     , className =? "libreoffice-startcenter"       --> doShift ( myWorkspaces !! 5 )

     -- CGI apps
     , className =? "Gimp-2.10"                     --> doShift ( myWorkspaces !! 6 )
     , className =? "Inkscape"                      --> doShift ( myWorkspaces !! 6 )
     , className =? "Blender"                       --> doShift ( myWorkspaces !! 6 )
     , className =? "krita"                         --> doShift ( myWorkspaces !! 6 )
     , className =? "kdenlive"                      --> doShift ( myWorkspaces !! 6 )


     -- Float dialogs
     , (className =? "firefox" <&&> resource =? "Dialog")           --> doFloat
     , (className =? "Gucharmap" <&&> resource =? "Dialog")         --> doFloat 
     , (className =? "Gimp-2.10" <&&> resource =? "Dialog")         --> doFloat 
     , isFullscreen -->  doFullFloat
     ] 

myKeys :: [(String, X ())]
myKeys =
        [
        -- If you set <myModMask> variable to mod4mask
        -- M  => Super key/Windows key
        -- C  => Ctrl
        -- S  => Shift
        -- M1 => Alt

        -- If you set <myModMask> variable to mod1mask
        -- M => Alt
        -- C  => Ctrl
        -- S  => Shift
        -- M1  => Super key/Windows key
------------------------------------------------------------------------------------

-- 90% of these keybindings will work on most keyboard layouts
-- for full functionality your keyboard layout should be en-us
-- to set your keymap to en-us simply execute this command on your terminal

--                   setxkbmap us

------------------------------------------------------------------------------------

    -- Xmonad
          ("M-C-r", spawn "xmonad --recompile")                -- Recompiles xmonad
        , ("M-S-r", spawn "xmonad --restart")                  -- Restarts xmonad
        , ("M-S-q", io exitSuccess)                            -- Quits xmonad
        , ("M-c", kill)  -- "M-S-c" works too but it's tiring  -- Kill focused
    
    -- Screen Locking
        , ("M-p", spawn "i3lock -i ~/.xmonad/lp.png")

    -- Run Prompt
    --  , ("M-S-<Return>", spawn "dmenu_run -i -p \"Run: \"") -- Dmenu
        , ("M-M1-<Return>", spawn "rofi -show run")           -- Rofi

    -- Useful Programs
        , ("M-<Return>", spawn (myTerminal))    -- Terminal
        , ("M-b", spawn myBrowser) -- Browser
        , ("M-M1-h", spawn (myTerminal ++ " -e htop")) -- Htop
        , ("M-v", spawn (myTerminal ++ " -e vis"))
        , ("M-e", spawn "pcmanfm")

     -- Workspaces
        , ("M-.", nextScreen)  -- Switch focus to next monitor
        , ("M-,", prevScreen)  -- Switch focus

    -- Floating windows
        , ("M-f", sendMessage (T.Toggle "floats")) -- Toggles my 'floats' layout
        , ("M-t", withFocused $ windows . W.sink)  -- Push floating window back to tile
        , ("M-S-t", sinkAll)                       -- Push ALL floating windows to tile

    -- Increase/decrease spacing (gaps)
        , ("C-M1-j", decWindowSpacing 2)         -- Decrease window spacing
        , ("C-M1-k", incWindowSpacing 2)         -- Increase window spacing
        , ("C-M1-h", decScreenSpacing 2)         -- Decrease screen spacing
        , ("C-M1-l", incScreenSpacing 2)         -- Increase screen spacing

    -- Grid Select (CTR-g followed by a key)
        , ("C-g g", spawnSelected' myAppGrid)                 -- grid select favorite apps
        , ("C-g t", goToSelected $ mygridConfig myColorizer)  -- all open windows
        , ("C-g b", bringSelected $ mygridConfig myColorizer) -- bring selected window to curretn workspace

    -- Windows navigation
        , ("M-m", windows W.focusMaster)  -- Move focus to the master window
        , ("M-j", windows W.focusDown)    -- Move focus to the next window
        , ("M-k", windows W.focusUp)      -- Move focus to the prev window
        , ("M-S-m", windows W.swapMaster) -- Swap the focused window and the master window
        , ("M-S-j", windows W.swapDown)   -- Swap focused window with next window
        , ("M-S-k", windows W.swapUp)     -- Swap focused window with prev window
        , ("M-<Backspace>", promote)      -- Moves focused window to master, others maintain order
        , ("M-S-<Tab>", rotSlavesDown)    -- Rotate all windows except master and keep focus in place
        , ("M-C-<Tab>", rotAllDown)       -- Rotate all the windows in the current stack

    -- Layoutsi3lock-fancy-git
        , ("M-<Tab>", sendMessage NextLayout)           -- Switch to next layout
        , ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) -- full screen view

    -- Increase/decrease windows in the master pane or the stack
        , ("M-S-<Up>", sendMessage (IncMasterN 1))      -- Increase # of clients master pane
        , ("M-S-<Down>", sendMessage (IncMasterN (-1))) -- Decrease # of clients master pane
        , ("M-C-<Up>", increaseLimit)                   -- Increase # of windows
        , ("M-C-<Down>", decreaseLimit)                 -- Decrease # of windows

    -- Window resizing
        , ("M-h", sendMessage Shrink)                   -- Shrink horiz window width
        , ("M-l", sendMessage Expand)                   -- Expand horiz window width
        , ("M-M1-j", sendMessage MirrorShrink)          -- Shrink vert window width
        , ("M-M1-k", sendMessage MirrorExpand)          -- Expand vert window width

   
    -- Controls for mocp music player (SUPER-u followed by a key)
        , ("M-u l", spawn "mocp --next")
        , ("M-u h", spawn "mocp --previous")
        , ("M-u <Space>", spawn "mocp --toggle-pause")
        ]
         
         where nonNSP          = WSIs (return (\ws -> W.tag ws /= "NSP"))


main :: IO ()
main = do
    -- Launching xmobar on monitor
    xmproc0 <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc0"
    -- xmproc1 <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc1"
    -- the xmonad, ya know...what the WM is named after!
    xmonad $ ewmh def
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageDocks
        -- Run xmonad commands from command line with "xmonadctl command". Commands include:
        -- shrink, expand, next-layout, default-layout, restart-wm, xterm, kill, refresh, run,
        -- focus-up, focus-down, swap-up, swap-down, swap-master, sink, quit-wm. You can run
        -- "xmonadctl 0" to generate full list of commands written to ~/.xsession-errors.
        , handleEventHook    = serverModeEventHookCmd
                               <+> serverModeEventHook
                               <+> serverModeEventHookF "XMONAD_PRINT" (io . putStrLn)
                               <+> docksEventHook
        , modMask            = myModMask
        , terminal           = myTerminal
        , startupHook        = myStartupHook
        , layoutHook         = showWName' myShowWNameTheme myLayoutHook
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormColor
        , focusedBorderColor = myFocusColor
        , logHook = workspaceHistoryHook <+> dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc0 x -- ppOutput = \x -> hPutStrLn xmproc0 x                          -- xmobar on monitor 1
                        --              >> hPutStrLn xmproc1 x                          -- xmobar on monitor 2
                        , ppCurrent = xmobarColor "#c3e88d" "" . wrap "[" "]" -- Current workspace in xmobar
                        , ppVisible = xmobarColor "#c3e88d" "" .clickable               -- Visible but not current workspace
                        , ppHidden = xmobarColor "#82ABAF" "" . wrap "*" "" .clickable  -- Hidden workspaces in xmobar
                        , ppHiddenNoWindows = xmobarColor "#F07178" "" .clickable      -- Hidden workspaces (no windows)
                        , ppTitle = xmobarColor "#d0d0d0" "" . shorten 120     -- Title of active window in xmobar
                        , ppSep =  "<fc=#666666> | </fc>"                     -- Separators in xmobar
                        , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"  -- Urgent workspace
                        , ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        }
        } `additionalKeysP` myKeys

