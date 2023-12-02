{ pkgs, config, lib, ... }: {

  imports = [
    <home-manager/nixos> 
    ./desktop/gnome.nix
    ./home/default.nix
    ./host/framework13/hardware-configuration.nix                    # generated hardware config
  ];

  users.users.mid = {
    description  = "The Middle Way";
    extraGroups  = [ "networkmanager" "wheel" ];
    isNormalUser = true;
  };
  time.timeZone = "America/Los_Angeles";

  home-manager = {
    users.mid = {
      home.username      = "mid";
      home.homeDirectory = "/home/mid";
      imports            = [ ./home/default.nix ./home/gnome.nix ];
      
      # The state version is required and should stay at the version you
      # originally installed.
      home.stateVersion = "23.11";
    };
    useGlobalPkgs     = true;
    useUserPackages   = true;
  };
  
  boot = {
    loader = {
      systemd-boot = {
        enable      = true;                         # EFI boot manager
        configurationLimit = 10;                    # limit to 10 generations
      };
      efi.canTouchEfiVariables = true;              # installation can modify EFI boot variables
    };

    supportedFilesystems = [ "ntfs" ];              # USB Drives might have this format
  };

  environment = {
    shells = with pkgs; [                           # List of available shells
      bash
      nushell
    ];

    systemPackages = with pkgs; [
      cups-brother-hll2350dw                        # home and office printer (2023)
      fwupd                                         # firmware update service
      tlp                                           # laptop power mgmt service
    ];
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    lexend
    nerdfonts
  ];

  hardware.pulseaudio.enable = false;               # AUDIO: turn off default pulse audio to use pipewire

  networking= {
    hostName              = "frame";
    networkmanager.enable = true;                   # Wifi Manager
    firewall.enable       = true;
  };

  nixpkgs.config.allowUnfree = true;                # PACKAGES: remove unfree check

  nix = {
    # map old school channels and paths to flake versions
    nixPath  = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    # registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    settings = {
      auto-optimise-store   = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {                                          # GARBAGE COLLECTION: https://nixos.wiki/wiki/Storage_optimization#Automation
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 7d";
    };
  };

  programs.zsh.enable = true;                       # ZSH

  security.rtkit.enable = true;                     # AUDIO: used by pipewire

  services = {
    avahi = {                                       # PRINTING: service discovery on a local network
      enable       = true;
      nssmdns      = true;
      openFirewall = true;                          # Wifi printing
    };

    flatpak.enable = true;                          # FLATPAK: user installeble

    pipewire = {                                    # AUDIO: sound services
      enable            = true;
      alsa.enable       = true;
      alsa.support32Bit = true;
      pulse.enable      = true;
    };

    printing = {
      enable  = true;
      drivers = [ pkgs.cups-brother-hll2350dw ];
    };

  };

  system = {
    autoUpgrade.enable = true;
    stateVersion       = "23.11";
  };
}
