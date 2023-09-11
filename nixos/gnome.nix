{ config, pkgs, ... }:{

  # ===============================================================================================
  # Enable GDM and GNOME
  # ===============================================================================================
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # ===============================================================================================
  #  Additions
  # ===============================================================================================
  # add the games pack
  services.gnome.games.enable = true;

  environment.systemPackages = (with pkgs; [
    # preferred packages
    gnome-extension-manager             # improved extension manager
    gnome-firmware                      # firmware application
    xclip                               # manages terminal to clipboard copies
    gnome.gnome-terminal                # simple backup terminal
    gnome.seahorse                      # manage encryption keys and passwords in the GnomeKeyring

    # preferred gnome extensions
    gnomeExtensions.auto-move-windows   # allow the forever assignment of application to a specific desktop
    gnomeExtensions.appindicator        # shows old-school icons in tray (some programs need this, like mega sync)
    gnomeExtensions.blur-my-shell       # add some modern blurrrr to the de
    gnomeExtensions.caffeine            # stay awake
    gnomeExtensions.clipman             # clipboard manager for taskbar
    gnomeExtensions.executor            # command output to taskbar: very powerful but I only use it for fortune quotes
    gnomeExtensions.forge               # tiling window manager
    gnomeExtensions.just-perfection     # tweaks to gnome visuals
    gnomeExtensions.launch-new-instance # when launching apps create a new instance, helps with closing only current window not all windows
    gnomeExtensions.openweather         # weather in the taskbar
    gnomeExtensions.space-bar           # display of workspace indicators (like i3)
    gnomeExtensions.wallpaper-switcher  # auto switch wallpapers
    gnomeExtensions.pano                # Next-gen Clipboard manager for Gnome Shell
  ]);

  # ===============================================================================================
  #  Exclusions
  # ===============================================================================================
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour                          # gnome first install tour
    gnome.cheese                        # webcam tool
    gnome.epiphany                      # web browser
    gnome.gnome-initial-setup
    gnome.gnome-maps
    gnome.gnome-music
    gnome.totem                         # gnome videos
    gnome.yelp                          # Help view
    xterm

    # gnome-photos                        # default photo app
    # gnome.geary                         # email reader
    # gnome.gnome-contacts
  ]);

  # remove xterm, good terminal, just not what I like
  services.xserver.desktopManager.xterm.enable = false;    # required to remove xterm

}
