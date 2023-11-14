{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config.theme = "base16";
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batpipe
      batwatch
      prettybat
    ];
  };
  home.shellAliases = {
    "cat"      = "bat --style=plain";
  };
}
