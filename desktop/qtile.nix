{ config, pkgs, ... }:{

  services.xserver.windowManager.qtile = {
    enable = true;

    # qtile python environment packages
    #extraPackages = python3Packages: with python3Packages; [
    #  qtile-extras
    #];

  };

  environment.systemPackages = with pkgs; [
    rofi
    pywal
    gcc
    keychain
    kanshi
    wallutils
  ];
}
