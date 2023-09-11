{ config, pkgs, ... }:{
  # NixOs Options | https://search.nixos.org/options
  # Packages      | https://search.nixos.org/packages

  imports = [
    ./gnome.nix                               # personalized gnome module
    ./hardware-configuration.nix              # generated (nixos-generate-config) hardware configuration
  ];

  networking.hostName       = "frame";
  time.timeZone             = "America/Los_Angeles";
  system.stateVersion       = "23.05";
  system.autoUpgrade.enable = true;           # auto upgrade nixos and nix packages

  users.users.mid = {
    isNormalUser  = true;
    description   = "The Middle Way";
    extraGroups   = [ "networkmanager" "wheel" ];
    packages      = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    # applications
    alacritty                                 # terminal improvement
    megasync                                  # cloud storage

    # browsers
    firefox
    chromium
    librewolf
    brave

    # command line tools
    fortune                                   # saying that make my day
    fzf                                       # fuzzy finder
    gcc                                       # c compiler
    git                                       # source control
    neovim                                    # editor (vim like)
    ripgrep                                   # grep replacement
    starship                                  # prompt
    tealdeer                                  # tldr replacement
    yadm                                      # dotfile management

    # experimental
    fd                                        # find replacement
    freshfetch                                # neofetch replacement
    helix                                     # editor (kakoune like)
    lazygit                                   # tui git client
    nushell                                   # modern shell written in Rust
    sd                                        # sed replacement
    xh                                        # curl replacement
    xplr                                      # tui file explorer
    zellij                                    # tmux replacement

    # fonts
    jetbrains-mono
    lexend
    nerdfonts

    # printers
    cups-brother-hll2350dw

    # services
    fwupd                                     # firmware update service
    tlp                                       # laptop power mgmt service
  ];

  # Audio Services ===========================
  services.pipewire = {
    enable = true;                            # https://pipewire.org/
    alsa.enable = true;                       # Advanced Linux Sound Architecture
    alsa.support32Bit = true;                 #     with 32 bit application support
    pulse.enable = true;                      # pulse audio emulation
  };
  hardware.pulseaudio.enable = false;         # turn off default pulse audio to use pipewire
  security.rtkit.enable = true;               # secure real-time scheduling for user processes (recommended)

  # Boot =====================================
  boot.loader = {
    systemd-boot.enable = true;               # EFI boot manager
    efi.canTouchEfiVariables = true;          # installation can modify EFI boot variables
  };

  # Flatpak ==================================
  services.flatpak.enable = true;             # allow for user installed packages via flatpak

  # File Services ============================
  boot.supportedFilesystems = [ "ntfs" ];     # NTFS for some of my USB Drives

  # Network Services =========================
  networking.networkmanager.enable = true;    # Wifi Manager

  # Printing Services ========================
  services.printing = {
    enable = true;
    drivers = [ pkgs.cups-brother-hll2350dw ];
  };
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;                      # for a WiFi printer
  };

  # System ===================================
  nixpkgs = {
    overlays = [ ];
    config.allowUnfree = true;
  };

  nix = {
    # This will add each flake input as a registry (giving nix3 command consistency with flakes)
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    # This will additionally add your inputs to the system's legacy channels. Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings ={
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;             # optimize links
    };
    # Garbage Collector
    gc = {
      automatic = true;                       # garbage collection << https://nixos.wiki/wiki/Storage_optimization#Automation
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

}
