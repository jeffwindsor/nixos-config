# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let 
  hostname       = "framework";
  locale         = "en_US.UTF-8";
  timezone       = "America/Los_Angeles";
  username       = "mid";
  userDescription = "The Middle Way";
in
{
  # 2023-12-18 : temporary add to get past build issues, should resolve over time
  #  some package needs to be updated so this dependency is fixed
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];


  # Include other modules
  imports = [ 
    <home-manager/nixos>
    ./desktop/gnome.nix
    ./hardware-configuration.nix                    # Include the results of the hardware scan.
  ];

  # Host and Users
  networking.hostName = hostname;
  time.timeZone = timezone;
  users.users."${username}" = {
    isNormalUser = true;
    description = userDescription;
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager = {
    users.mid = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      imports = [ 
        ./home.nix 
        ./home/dconf-org-gnome.nix 
      ];
    };
    useGlobalPkgs     = true;
    useUserPackages   = true;
  };


  # Boot loader
  boot.loader = {
    systemd-boot = {
      enable = true;                                # EFI boot manager
      configurationLimit = 10;                      # limit to 10 generations
    };
    efi.canTouchEfiVariables = true;                # installation can modify EFI boot variables
  };
  boot.supportedFilesystems = [ "ntfs" ];           # USB Drives might have this format 
 
  # Shells available to all users
  environment.shells = with pkgs; [ bash nushell ];

  # Packages available to all users
  environment.systemPackages = with pkgs; [
    bash
    bat               # cat replacement
    delta             # git pager
    eza               # ls replacement
    fastfetch
    fd
    fzf
    git
    lazygit
    neovim
    ripgrep
    sd
    starship          # prompt
    stow              # dot file manager
    tldr
    yazi              # terminal file manager
    zellij            # multiplexer
    zoxide

    #alacritty
    wezterm
    #qbittorrent
    firefox
    vlc

    cups-brother-hll2350dw                          # home and office printer (2023)
    fwupd                                           # firmware update service
    pciutils
    tlp                                             # laptop power mgmt service
  ];
  
  # Fonts available to all users
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerdfonts
  ];

  # Internationalisation
  i18n = {
    defaultLocale = locale;
    extraLocaleSettings = {
      LC_ADDRESS = locale;
      LC_IDENTIFICATION = locale;
      LC_MEASUREMENT = locale;
      LC_MONETARY = locale;
      LC_NAME = locale;
      LC_NUMERIC = locale;
      LC_PAPER = locale;
      LC_TELEPHONE = locale;
      LC_TIME = locale;
    };
  };

  # Networking 
  networking.networkmanager.enable = true;

  # Package Managers
  nix.settings.auto-optimise-store = true;          # automatic optimization
  nix.gc = {                                        # automatic garbage collection, weekly for older than 30 days
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nixpkgs.config.allowUnfree = true;                # allow unfree packages in nix
  
  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    xkb.layout = "us";                                  # Configure keymap in X11
    xkb.variant = "";
  };

  # Enable printing
  services.printing = {
    enable  = true;
    drivers = [ 
      pkgs.cups-brother-hll2350dw                   # personal wifi printer 
    ];
  };
  
  # Enable printing service discovery on a local network
  services.avahi = {                              
    enable       = true;
    nssmdns4     = true;
    openFirewall = true;                            # Wifi printing
  };

  # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
