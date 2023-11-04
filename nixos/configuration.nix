{ inputs, outputs, lib, config, pkgs, build, ... }: {

  imports = [
    # ./hyprland.nix
    inputs.home-manager.nixosModules.home-manager
    ./gnome.nix                                     # add personalized gnome de
    ./hardware-configuration.nix                    # generated hardware config
  ];

  boot = {
    loader = {
      systemd-boot.enable      = true;              # EFI boot manager
      efi.canTouchEfiVariables = true;              # installation can modify EFI boot variables
    };

    supportedFilesystems = [ "ntfs" ];              # USB Drives might have this format
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];                 # ZSH

    shells = with pkgs; [
      bash
      nushell
      zsh                                           # ZSH
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
    hostName              = "${build.hostname}";
    networkmanager.enable = true;                   # Wifi Manager
    firewall.enable       = true;
  };

  nixpkgs.config.allowUnfree = true;                # PACKAGES: remove unfree check

  nix = {
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
    stateVersion       = "${build.stateVersion}";
  };

  time.timeZone = "${build.timeZone}";

  users.users.${build.user} = {
    description  = "${build.userDescription}";
    extraGroups  = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    packages     = with pkgs; [];
    shell        = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs    = { inherit inputs outputs build; };
    useGlobalPkgs       = true;
    useUserPackages     = true;
    users.${build.user} = import ../home-manager/home.nix;
  };
}
