{ pkgs, ... }: {
  
	home.sessionVariables = {
  	PREVIEWER = "bat --style=numbers --color=always";
  };
  
  home.shellAliases = {
    "cat"      = "bat --style=plain";
  };
  
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
}
