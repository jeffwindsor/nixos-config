{ config, ... }: {
  programs.zellij = {
    enable = true;
    #enableBashIntegration = true;
    #enableZshIntegration = true;
    settings = {
      theme = "base16";
      themes = with config.colorScheme.colors; {
        base16 = {
          fg "#${base06}";
          bg "#${base01}";
          black "#${base00}";
          red "#${base08}";
          green "#${base0B}";
          yellow "#${base0A}";
          blue "#${base0D}";
          magenta "#${base0E}";
          cyan "#${base0C}";
          white "#${base07}";
          orange "#${base09}";
        };
        nord = {
          fg "#D8DEE9";
          bg "#2E3440";
          black "#3B4252";
          red "#BF616A";
          green "#A3BE8C";
          yellow "#EBCB8B";
          blue "#81A1C1";
          magenta "#B48EAD";
          cyan "#88C0D0";
          white "#E5E9F0";
          orange "#D08770";
        };
      };
    };
  };
}
