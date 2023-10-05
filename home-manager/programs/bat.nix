{ pkgs, ... }: {
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
}
