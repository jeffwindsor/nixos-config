{ config, ... }: {
  enable = true;
  #enableBashIntegration = true;
  #enableZshIntegration = true;
  settings = {
    copy_command = "wl-copy";
    
           
    theme = "base16";
    themes = with config.colorScheme.colors; {
      base16 = {
        fg = "#${base06}";
        bg = "#${base01}";
        black = "#${base00}";
        red = "#${base08}";
        green = "#${base0B}";
        yellow = "#${base0A}";
        blue = "#${base0D}";
        magenta = "#${base0E}";
        cyan = "#${base0C}";
        white = "#${base07}";
        orange = "#${base09}";
      };
    };
  };
}