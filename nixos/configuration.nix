# TODO separate out variables and pass to other files
# like user name 'mid'
 
{ config, pkgs, ... }:{                       # https://search.nixos.org/options

  imports = [
    <home-manager/nixos>
    ./gnome.nix                               # add personalized gnome de
    ./hardware-configuration.nix              # generated hardware config
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;             # EFI boot manager
      efi.canTouchEfiVariables = true;        # installation can modify EFI boot variables
    };

    supportedFilesystems = [ "ntfs" ];        # USB Drives might have this format
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];

    shells = with pkgs; [
      bash
      nushell
      zsh
    ];

    systemPackages = with pkgs; [
      # fonts
      jetbrains-mono                          # main font
      lexend
      nerdfonts

      # system
      cups-brother-hll2350dw                  # home and office printer (2023)
      fwupd                                   # firmware update service
      tlp                                     # laptop power mgmt service
    ];
  };

  # AUDIO: turn off default pulse audio to use pipewire
  hardware.pulseaudio.enable = false;

  networking= {
    hostName = "frame";
    networkmanager.enable = true;             # Wifi Manager
  };

  # PACKAGES: remove unfree check
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    # GARBAGE COLLECTION: https://nixos.wiki/wiki/Storage_optimization#Automation
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs.zsh.enable = true;

  # AUDIO: used by pipewire
  security.rtkit.enable = true;

  services = {
    # PRINTING: service discovery on a local network
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;                  # Wifi printing
    };

    # FLATPAK: user installeble
    flatpak.enable = true;

    # AUDIO: sound services
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # PRINTING: standard printing services
    printing = {
      enable = true;
      drivers = [ pkgs.cups-brother-hll2350dw ];
    };

  };

  system = {
    autoUpgrade.enable = true;
    stateVersion = "23.05";
  };

  time.timeZone = "America/Los_Angeles";

  users.users.mid = {
    description = "The Middle Way";
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mid = import ./home-manager/home.nix;
  };

}
