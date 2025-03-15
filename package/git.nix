{ config, pkgs, ... }:{

  # add packages 
  environment.systemPackages = with pkgs; [
    git
    lazygit           # gui tui
  ];

}
