{ config, pkgs, ... }:{

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  }
# use Wayland where possible (electron)
  environment.variables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    # look and feel
    waybar                      # wayland bar
    eww                         # standalone widget system made in Rust
    wpaperd                     # wallpapers deamon
    pywal                       # change colorschemes on the fly

    # services
     #swhkd                       # display protocol-independent hotkey daemon made in Rust
    clipman                     # clipboard manager for Wayland
    wl-clipboard                # command-line copy/paste utilities for Wayland
    grim                        # screen shot
    # dunst
    # polkit                      # defining and handling the policy that allows unprivileged processes to speak to privileged processes
    # plkit_gnome                 # dbus service for authentication dialogs
    # upower                      # dbus service for power management

    # applications
    # hw-probe                    # a tool to probe for hardware, check operability and find drivers
    imagemagick                 # image editing
    popsicle                    # usb file flasher
    wlogout                     # wayland based logout menu
    wofi                        # launcher/menu program

    baobab                      # disk usage analyzer [ other? ]
    gnome.gnome-calculator      # calculator          [ other? ]
    gnome.gnome-disk-utility    # disk manager        [ other? ]
    gnome.gnome-keyring         # keyring             [ other? ]
    gnome.nautilus              # file manager        [ other? ]
    gnome.seahorse              # gnome keyring gui   [ other? ]

    # fonts for UI
    material-symbols            # Material Symbols icons by Google

    #source-sans
    #noto-fonts
    #dejavu_fonts
    #roboto
    #ubuntu_font_family
  ];

}
