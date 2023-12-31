# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/Console" = {
      audible-bell = false;
      custom-font = "DejaVu Sans Mono 16";
      last-window-size = mkTuple [ 652 480 ];
      use-system-font = false;
      visual-bell = false;
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "advanced";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      window-maximized = false;
      window-size = mkTuple [ 680 584 ];
      word-size = 64;
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };
    
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      clock-format = "12h";
      color-scheme = "prefer-dark";
      enable-animations = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "firefox" ];
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/wm/keybindings" = {
      begin-move = [];
      begin-resize = [];
      close = [ "<Super>q" ];
      maximize = [];
      minimize = [];
      move-to-workspace-1 = [ "<Super><Control>1" ];
      move-to-workspace-10 = [ "<Super><Control>0" ];
      move-to-workspace-2 = [ "<Super><Control>2" ];
      move-to-workspace-3 = [ "<Super><Control>3" ];
      move-to-workspace-4 = [ "<Super><Control>4" ];
      move-to-workspace-5 = [ "<Super><Control>5" ];
      move-to-workspace-6 = [ "<Super><Control>6" ];
      move-to-workspace-7 = [ "<Super><Control>7" ];
      move-to-workspace-8 = [ "<Super><Control>8" ];
      move-to-workspace-9 = [ "<Super><Control>9" ];
      panel-run-dialog = [];
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-10 = [ "<Super>0" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      switch-to-workspace-7 = [ "<Super>7" ];
      switch-to-workspace-8 = [ "<Super>8" ];
      switch-to-workspace-9 = [ "<Super>9" ];
      switch-to-workspace-left = [ "<Super>Left" ];
      switch-to-workspace-right = [ "<Super>Right" ];
      toggle-fullscreen = [];
      toggle-maximized = [];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close:appmenu";
      num-workspaces = 10;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      workspaces-only-on-primary = true;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [];
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "medium";
      use-tree-view = true;
    };

    "org/gnome/nautilus/preferences" = {
      click-policy = "double";
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
      search-view = "list-view";
      show-delete-permanently = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      calculator = [ "<Super>c" ];
      control-center = [ "<Super>comma" ];
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/" ];
      help = [];
      home = [ "<Super>f" ];
      logout = [];
      magnifier = [];
      magnifier-zoom-in = [];
      magnifier-zoom-out = [];
      next = [ "AudioForward" ];
      previous = [ "AudioRewind" ];
      screenreader = [];
      screensaver = [];
      www = [ "<Super>b" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super><Control>q";
      command = "gnome-session-quit";
      name = "Logout";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super><Control>p";
      command = "systemctl poweroff";
      name = "Power-Off";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super><Control>r";
      command = "systemctl reboot";
      name = "Reboot";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super><Control>s";
      command = "systemctl suspend";
      name = "Suspend";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "<Super>o";
      command = "obsidian";
      name = "Obsidian";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5" = {
      binding = "<Super>e";
      command = "extension-manager";
      name = "Extensions";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6" = {
      binding = "<Super>g";
      command = "flatpak run org.gnucash.GnuCash";
      name = "GNU Cash";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7" = {
      binding = "<Super>s";
      command = "flatpak run com.spotify.Client";
      name = "Spotify";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8" = {
      binding = "<Super>t";
      command = "env WINIT_UNIX_BACKEND=x11 alacritty";
      name = "Terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9" = {
      binding = "<Super>m";
      command = "xdg-open 'https://maps.google.com'";
      name = "Google Maps";
    };

    "org/gnome/shell" = {
      command-history = [ "r" ];
      enabled-extensions = ["launch-new-instance@gnome-shell-extensions.gcampax.github.com" "openweather-extension@jenslody.de" "forge@jmmaranan.com" "blur-my-shell@aunetx" "WallpaperSwitcher@Rishu" "appindicatorsupport@rgcjonas.gmail.com" "just-perfection-desktop@just-perfection" "pano@elhan.io" "caffeine@patapon.info" "weatherornot@somepaulo.github.io" "azwallpaper@azwallpaper.gitlab.com"];
      welcome-dialog-last-shown-version = "45.1";
    };

    "org/gnome/shell/extensions/WallpaperSwitcher" = {
      error-msg = "";
      frequency = 1200;
      wallpaper-path = "/home/mid/portable/wallpapers/desktop";
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = 1;
      toggle-shortcut = [ "<Super>Delete" ];
    };

    "org/gnome/shell/extensions/executor" = {
      center-active = false;
      left-commands-json = ''
        {"commands":[{"isActive":true,"command":"fortune /home/mid/.config/fortune/quotes","interval":600,"uuid":"e029a6a2-3ba2-424b-bcc3-bf74d39fe75a"}]}\n
      '';
      left-index = 3;
      right-active = false;
    };

    "org/gnome/shell/extensions/forge" = {
      css-last-update = mkUint32 37;
      focus-border-toggle = true;
      quick-settings-enabled = true;
      stacked-tiling-mode-enabled = true;
      window-gap-hidden-on-single = true;
      window-gap-size = 2;
      window-gap-size-increment = 4;
      workspace-skip-tile = "";
    };

    "org/gnome/shell/extensions/forge/frequency" = {
      tiling-mode-enabled = true;
      window-gap-size-increment = 1;
    };

    "org/gnome/shell/extensions/forge/keybindings" = {
      con-split-horizontal = [ "<Super><Control>Right" ];
      con-split-layout-horizontal = [ "<Super><Control>Right" ];
      con-split-layout-toggle = [];
      con-split-layout-vertical = [ "<Super><Control>Down" ];
      con-split-vertical = [ "<Super><Control>Down" ];
      con-stacked-layout-toggle = [];
      con-tabbed-layout-toggle = [];
      con-tabbed-layout-toogle = [];
      con-tabbed-showtab-decoration-toggle = [];
      focus-border-toggle = [];
      prefs-open = [];
      prefs-tiling-toggle = [];
      window-focus-down = [ "<Super>j" ];
      window-focus-left = [ "<Super>h" ];
      window-focus-right = [ "<Super>l" ];
      window-focus-up = [ "<Super>k" ];
      window-gap-size-decrease = [ "<Super><Control><Alt>minus" ];
      window-gap-size-increase = [ "<Super><Control><Alt>plus" ];
      window-move-down = [ "<Super><Control><Alt>j" ];
      window-move-left = [ "<Super><Control><Alt>h" ];
      window-move-right = [ "<Super><Control><Alt>l" ];
      window-move-up = [ "<Super><Control><Alt>k" ];
      window-resize-bottom-decrease = [];
      window-resize-bottom-increase = [];
      window-resize-left-decrease = [ "<Super><Control>minus" ];
      window-resize-left-increase = [ "<Super><Control>plus" ];
      window-resize-right-decrease = [ "<Shift><Control><Super>y" ];
      window-resize-right-increase = [];
      window-resize-top-decrease = [];
      window-resize-top-increase = [];
      window-snap-center = [];
      window-snap-one-third-left = [];
      window-snap-one-third-right = [];
      window-snap-two-third-left = [];
      window-snap-two-third-right = [];
      window-swap-down = [ "<Super><Control>j" ];
      window-swap-last-active = [];
      window-swap-left = [ "<Super><Control>h" ];
      window-swap-right = [ "<Super><Control>l" ];
      window-swap-up = [ "<Super><Control>k" ];
      window-toggle-always-float = [];
      window-toggle-float = [ "<Super><Control>f" ];
      window-toggle-float-always = [];
      workspace-active-tile-toggle = [ "<Super><Control>Delete" ];
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
      app-menu-label = false;
      panel = false;
      panel-in-overview = true;
      startup-status = 0;
    };

    "org/gnome/shell/extensions/openweather" = {
      actual-city = 2;
      city = "30.2711286,-97.7436995>Austin, Travis County, Texas, United States>0 && 39.7392364,-104.984862>Denver, Colorado, United States>0 && 34.2783355,-119.293174>Ventura, Ventura County, CAL Fire Southern Region, California, United States>0";
      position-index = 1;
      unit = "fahrenheit";
      wind-speed-unit = "mph";
    };

    "org/gnome/shell/extensions/space-bar/behavior" = {
      show-empty-workspaces = false;
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [];
      open-application-menu = [ "<Alt>1" ];
      show-screenshot-ui = [ "<Control>grave" ];
      switch-to-application-1 = [];
      switch-to-application-10 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      toggle-application-view = [ "<Super>a" ];
      toggle-message-tray = [];
      toggle-overview = [];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/software" = {
      first-run = false;
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 157;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 1231 902 ];
    };

  };
}
