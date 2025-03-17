# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let 
  hostname        = "framework";
  keyboard_layout = "us";
  locale          = "en_US.UTF-8";
  timezone        = "America/Los_Angeles";
  username        = "mid";
  userDescription = "The Middle Way";
in
{
  # Include other modules
  imports = [ 
    ./desktop/gnome.nix
    ./package/git.nix
    ./package/zsh.nix
    # Requires the following channel
    #   $ sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
    #   $ sudo nix-channel --update
    <nixos-hardware/framework/13-inch/11th-gen-intel>
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # Boot loader
  boot = {
    loader = {
      systemd-boot = {
        enable = true;                           # EFI boot manager
        configurationLimit = 10;                 # limit to 10 generations
      };
      efi.canTouchEfiVariables = true;           # installation can modify EFI boot variables
    };
    supportedFilesystems = [ "ntfs" ];           # USB Drives might have this format 
  };

  # Packages available to all users
  environment.systemPackages = with pkgs; [
    bat
    eza
    fd
    firefox        # web browser
    fzf
    google-chrome  # web browser
    helix          # editor
    nushell        # shell
    ripgrep
    sd
    starship       # prompt
    stow           # used for dotfiles
    yazi           # file manager tui
    zsh            # shell
    
    alacritty
    ghostty
    iina

    cups-brother-hll2350dw                          # home and office printer (2023)
    fwupd                                           # firmware update service
    pciutils
    tlp                                             # laptop power mgmt service
  ];
  
  # Fonts available to all users
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
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
  networking = {
    networkmanager.enable = true;
    hostName = hostname;
  };

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
    xkb.layout = keyboard_layout;                                  # Configure keymap in X11
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
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  time.timeZone = timezone;

  users.users."${username}" = {
    isNormalUser = true;
    description = userDescription;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
