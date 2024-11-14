{ config, pkgs, ... }:{

  # add packages 
  environment.systemPackages = with pkgs; [
    git
    delta             # git pager
    lazygit           # gui tui
  ];

}
