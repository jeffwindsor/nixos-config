{ config, pkgs, ... }:{

  # add to available shells
  environment.shells = with pkgs; [ zsh ];
  # default all users to zsh
  users.defaultUserShell = pkgs.zsh;
  # add package 
  environment.systemPackages = with pkgs; [
    zsh
  ];
  # enable zsh
  programs.zsh.enable = true;

}
