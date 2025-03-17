{ pkgs, ... }:{

  services.flatpak.enable = true;                   # enable flatpak usage

  # Add packages I like with Gnome
  environment.systemPackages = with pkgs; [
    wl-clipboard                        # wayland cli clipboard enabler
    gnome-extension-manager             # improved extension manager
    gnome-firmware                      # firmware application
    gnome.seahorse                      # manage encryption keys and passwords in the GnomeKeyring

    #### gnome extensions #####
    gnomeExtensions.appindicator         # shows old-school icons in tray (some programs need this, like mega sync)
    #gnomeExtensions.auto-move-windows   # allow the forever assignment of application to a specific desktop
    gnomeExtensions.blur-my-shell        # add some modern blurrrr to the de
    gnomeExtensions.caffeine             # stay awake
    #gnomeExtensions.clipman             # clipboard manager for taskbar
    #gnomeExtensions.color-picker        # Simple color picker for gnome shell
    #gnomeExtensions.executor            # command output to taskbar: very powerful but I only use it for fortune quotes
    gnomeExtensions.forge                # tiling window manager
    gnomeExtensions.just-perfection      # tweaks to gnome visuals
    gnomeExtensions.launch-new-instance  # when launching apps create a new instance, helps with closing only current window not all windows
    gnomeExtensions.weather-or-not       # weather in the taskbar
    #gnomeExtensions.pano                # Next-gen Clipboard manager for Gnome Shell
    #gnomeExtensions.space-bar           # display of workspace indicators (like i3)
    gnomeExtensions.wallpaper-slideshow  # auto switch wallpapers
    #gnomeExtensions.wallpaper-switcher  # auto switch wallpapers
  ];

  # Exclude Packages from Gnome Derivation I do not need
  environment.gnome.excludePackages = with pkgs; [
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    gnome-characters
    gnome-initial-setup
    gnome-maps
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    gnome-tour # gnome first install tour
    totem # video player
    xterm
    yelp  # Help view
  ];

  # Add the games pack
  services.gnome.games.enable = true;

  # Enable GDM and GNOME
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
      xterm.enable = false;    # Required to remove xterm
    };
  };

}
