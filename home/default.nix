{ pkgs,  ... }: {

  imports = [ 
    ./alacritty.nix
    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./hledger.nix
    ./lf.nix
    ./ripgrep.nix
    ./starship.nix
    ./tealdeer.nix
    ./zellij.nix
  ];

  programs = {
    chromium.enable = true;
    firefox.enable  = true;
    lazygit.enable  = true;
    nushell.enable  = true;
  };

  home = {
    # files = {
    #   ".config/fortune/build.sh" = ;
    #   ".config/fortune/quotes" = ;
    # };
    packages = with pkgs; [
      ### GUI ###
      brave             # backup browser
      libreoffice       # office
      megasync          # cloud storage
      obsidian          # notes
      # popsicle          # usb flasher
      spotify           # music player
      transmission-gtk  # bit torrent
      vlc               # video player
      
      ### TUI ###
      fd                # find replacement
      fortune           # saying that make my day
      # gcc               # c compiler, required for nvim+treesitter
      just              # run project-specific commands, like make
      jq                # json tool
      sd                # sed replacement
      xh                # curl replacement
      xplr              # tui file explorer
    ];

    shellAliases = {
      # nixos
      "system"   = "cd $LOC_NIXOS && hx .";
      "clean"    = "nix-env --delete-generations +10 && nix-collect-garbage && nix store optimise && flatpak uninstall --unused -y";
      "list"     = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      "rebuild"  = "sudo nixos-rebuild switch";
      "upgrade"  = "sudo nix-channel --update";
      "shell"    = "nix-shell";
    };
    
    sessionVariables = {
      LOC_JEFF    = "$HOME/Source/github.com/jeffwindsor";
      LOC_NIXOS   = "$HOME/Source/github.com/jeffwindsor/nixos-config";
      LOC_SRC     = "$HOME/Source";
    };
    
    stateVersion  = "23.11";
  };
}
