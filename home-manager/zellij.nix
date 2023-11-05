{ ... }: {
  enable = true;
  #enableBashIntegration = true;
  #enableZshIntegration = true;
  settings = {
    copy_command = "wl-copy";
    theme = "tender";
    themes = {
      tender= {
        fg = "#eeeeee";
        bg = "#282828";
        black = "#282828";
        red = "#f43753";
        green = "#c9d05c";
        yellow = "#ffc24b";
        blue = "#b3deef";
        magenta = "#d3b987";
        cyan = "#73cef4";
        white = "#eeeeee";
        orange = "#715b2f";
      };
    };
  };
}   
