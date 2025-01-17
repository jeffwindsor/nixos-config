#!/usr/bin/env bash
cd "$(dirname "${0}")" || exit

clear

###############################################################################
# gnome
#
# to discover the key value pairs to set, run a terminal with `dconf watch/`
# then go about setting the values through the GUI and the key-value will be
# printed out for you.  Note you will not need all printed out values, since
# some are about movement (ie last placed visited) and you will have to build your
# line with the following pattern with values exactly as they are printed out
# dconf write "key" "value"
#
# I like to post test the lines I create in antoher terminal, but your milage
# may vary
#
###############################################################################
mod="<Super>"
mod2="<Control>"

dconf write "/org/gnome/desktop/calendar/show-weekdate" "true"
dconf write "/org/gnome/desktop/datetime/automatic-timezone" "true"
dconf write "/org/gnome/desktop/interface/clock-format" "'12h'"
dconf write "/org/gnome/desktop/interface/clock-show-weekday" "true"
dconf write "/org/gnome/desktop/interface/color-scheme" "'prefer-dark'"
dconf write "/org/gnome/desktop/interface/gtk-theme" "'Adwaita-dark'"
dconf write "/org/gnome/desktop/interface/locate-pointer" "true"
dconf write "/org/gnome/desktop/interface/text-scaling-factor" "1.25"
dconf write "/org/gnome/desktop/peripherals/touchpad/click-method" "'fingers'"
dconf write "/org/gnome/desktop/peripherals/touchpad/natural-scroll" "true"
dconf write "/org/gnome/desktop/peripherals/touchpad/speed" "0.4"
dconf write "/org/gnome/desktop/peripherals/touchpad/two-finger-scrolling-enabled" "true"
dconf write "/org/gnome/desktop/wm/keybindings/close" "['${mod}q']"
dconf write "/org/gnome/desktop/wm/keybindings/minimize" "['${mod}w']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-1" "['${mod}${mod2}1']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-10" "['${mod}${mod2}0']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-2" "['${mod}${mod2}2']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-3" "['${mod}${mod2}3']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-4" "['${mod}${mod2}4']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-5" "['${mod}${mod2}5']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-6" "['${mod}${mod2}6']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-7" "['${mod}${mod2}7']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-8" "['${mod}${mod2}8']"
dconf write "/org/gnome/desktop/wm/keybindings/move-to-workspace-9" "['${mod}${mod2}9']"
dconf write "/org/gnome/desktop/wm/keybindings/panel-run-dialog" "['${mod2}space']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-input-source" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/switch-input-source-backward" "@as []"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-1" "['${mod}1']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-10" "['${mod}0']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-2" "['${mod}2']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-3" "['${mod}3']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-4" "['${mod}4']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-5" "['${mod}5']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-6" "['${mod}6']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-7" "['${mod}7']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-8" "['${mod}8']"
dconf write "/org/gnome/desktop/wm/keybindings/switch-to-workspace-9" "['${mod}9']"
dconf write "/org/gnome/desktop/wm/keybindings/toggle-fullscreen" "['${mod}${mod2}m']"
dconf write "/org/gnome/desktop/wm/preferences/button-layout" "'close:appmenu'"
dconf write "/org/gnome/desktop/wm/preferences/num-workspaces" "10"
dconf write "/org/gnome/mutter/dynamic-workspaces" "false"
dconf write "/org/gnome/mutter/keybindings/toggle-tiled-left" "@as []"
dconf write "/org/gnome/mutter/keybindings/toggle-tiled-right" "@as []"
dconf write "/org/gnome/mutter/workspaces-only-on-primary" "true"
dconf write "/org/gnome/nautilus/preferences/default-folder-viewer" "'list-view'"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/control-center" "['${mod}comma']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/home" "['${mod}f']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/next" "['AudioForward']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/previous" "['AudioRewind']"
dconf write "/org/gnome/settings-daemon/plugins/media-keys/www" "['${mod}b']"
dconf write "/org/gnome/shell/keybindings/focus-active-notification" "@as []"
dconf write "/org/gnome/shell/keybindings/show-screenshot-ui" "['<Control>grave']"
dconf write "/org/gnome/shell/keybindings/switch-to-application-1" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-10" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-2" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-3" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-4" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-5" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-6" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-7" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-8" "@as []"
dconf write "/org/gnome/shell/keybindings/switch-to-application-9" "@as []"
dconf write "/org/gnome/shell/keybindings/toggle-message-tray" "@as []"
dconf write "/org/gtk/gtk4/settings/file-chooser/show-hidden" "true"
dconf write "/org/gtk/settings/file-chooser/clock-format" "'12h'"

###############################################################################
# Custom Key Bindings
###############################################################################
custom_keys="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
custom="${custom_keys}/custom"

dconf write "$custom_keys" "[\
  '${custom}0/','${custom}1/','${custom}2/','${custom}3/',\
  '${custom}4/','${custom}5/','${custom}6/','${custom}7/',\
  '${custom}8/']"

dconf write "${custom}0/binding" "'${mod}${mod2}l'"
dconf write "${custom}0/command" "'gnome-session-quit'"
dconf write "${custom}0/name" "'Logout'"

dconf write "${custom}1/binding" "'${mod}${mod2}p'"
dconf write "${custom}1/command" "'systemctl poweroff'"
dconf write "${custom}1/name" "'Power-Off'"

dconf write "${custom}2/binding" "'${mod}${mod2}r'"
dconf write "${custom}2/command" "'systemctl reboot'"
dconf write "${custom}2/name" "'Reboot'"

dconf write "${custom}3/binding" "'${mod}${mod2}s'"
dconf write "${custom}3/command" "'systemctl suspend'"
dconf write "${custom}3/name" "'Suspend'"

#dconf write "${custom}4/binding" "'${mod}${mod2}t'"
#dconf write "${custom}4/command" "'env WINIT_UNIX_BACKEND=x11 alacritty --config-file \"$HOME\"/.config/alacritty/alacritty-ostree.yml'"
#dconf write "${custom}4/name" "'OS-Tree'"


dconf write "${custom}4/binding" "'${mod}o'"
dconf write "${custom}4/command" "'obsidian'"
dconf write "${custom}4/name" "'Obsidian'"

dconf write "${custom}5/binding" "'${mod}e'"
dconf write "${custom}5/command" "'extension-manager'"
dconf write "${custom}5/name" "'Extensions'"

dconf write "/org/gnome/shell/extensions/forge/keybindings/con-split-layout-toggle" "@as []"
dconf write "${custom}6/binding" "'${mod}g'"
dconf write "${custom}6/command" "'gnucash'"
dconf write "${custom}6/name" "'GNU Cash'"

dconf write "/org/gnome/shell/keybindings/toggle-overview" "@as []"
dconf write "${custom}7/binding" "'${mod}s'"
dconf write "${custom}7/command" "'spotify'"
dconf write "${custom}7/name" "'Spotify'"

dconf write "${custom}8/binding" "'${mod}t'"
dconf write "${custom}8/command" "'env WINIT_UNIX_BACKEND=x11 alacritty'"
dconf write "${custom}8/name" "'Terminal'"

###############################################################################
# extensions
###############################################################################
# enable preferred extensions
dconf write "/org/gnome/shell/enabled-extensions" "['launch-new-instance@gnome-shell-extensions.gcampax.github.com', 'space-bar@luchrioh', 'openweather-extension@jenslody.de', 'just-perfection-desktop@just-perfection', 'forge@jmmaranan.com', 'executor@raujonas.github.io', 'caffeine@patapon.info', 'blur-my-shell@aunetx', 'appindicatorsupport@rgcjonas.gmail.com', 'WallpaperSwitcher@Rishu']"
# set extension preferences
# | AppIndicator      |  615
# | Blur My Shell     | 3193
# | Caffeine          |  517
dconf write "/org/gnome/shell/extensions/caffeine/toggle-shortcut" "['<Super>Delete']"
# | Executor          | 2932
dconf write "/org/gnome/shell/extensions/executor/center-active" "false"
dconf write "/org/gnome/shell/extensions/executor/left-index" "3"
dconf write "/org/gnome/shell/extensions/executor/right-active" "false"
# | Forge             | 4481
dconf write "/org/gnome/shell/extensions/forge/frequency/tiling-mode-enabled" "true"
dconf write "/org/gnome/shell/extensions/forge/frequency/window-gap-size-increment" "1"
# | Just Perfection   | 3843
dconf write "/org/gnome/shell/extensions/just-perfection/accessibility-menu" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/activities-button" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/app-menu-label" "false"
dconf write "/org/gnome/shell/extensions/just-perfection/startup-status" "0"
# | Open Weather      |  750
dconf write "/org/gnome/shell/extensions/openweather/actual-city" "2"
dconf write "/org/gnome/shell/extensions/openweather/city" "'30.2711286,-97.7436995>Austin, Travis County, Texas, United States>0 && 39.7392364,-104.984862>Denver, Colorado, United States>0 && 34.2783355,-119.293174>Ventura, Ventura County, CAL Fire Southern Region, California, United States>0'"
dconf write "/org/gnome/shell/extensions/openweather/position-index" "1"
dconf write "/org/gnome/shell/extensions/openweather/unit" "'fahrenheit'"
dconf write "/org/gnome/shell/extensions/openweather/wind-speed-unit" "'mph'"
# | Space Bar         | 5090
dconf write "/org/gnome/shell/extensions/space-bar/behavior/show-empty-workspaces" "false"
# | Wallpaper Switcher| 4812
dconf write "/org/gnome/shell/extensions/WallpaperSwitcher/frequency" "1200"
dconf write "/org/gnome/shell/extensions/WallpaperSwitcher/wallpaper-path" "'/home/mid/portable/wallpapers/desktop'"
