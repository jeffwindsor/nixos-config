{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      cursor.style = "Block";
      
      env.TERM = "xterm-256color";
      
      font = {
        # normal.family = "FiraCode Nerd Font Mono";
        normal.family = "JetBrainsMono Nerd Font";
        size = 16;
        draw_bold_text_with_bright_colors = true;
      };
      
      selection.save_to_clipboard = true;

      window = {
        padding = { x = 10; y = 10; };
        opacity = 0.98;
        decorations = "none";
      };
      
      colors = {
        #TENDER
        primary ={
          background = "#282828";
          foreground = "#eeeeee";
        };

        bright = {
          black =   "#282828";
          red =     "#c5152f";
          green =   "#9faa00";
          yellow =  "#ffb118";
          blue =    "#44bdf0";
          magenta = "#876faf";
          cyan =    "#89cce6";
          white =   "#dadada";
        };
        
        normal = {
          black =   "#4c4c4c";
          red =     "#f43753";
          green =   "#c9d05c";
          yellow =  "#ffc24b";
          blue =    "#73cef4";
          magenta = "#a38fc1";
          cyan =    "#b3deef";
          white =   "#feffff";
        };
      };
    
    };
  };
}

