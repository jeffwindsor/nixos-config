{ ... }: {
    enable = true;
    settings = {
      cursor.style = "Block";
      
      env.TERM = "xterm-256color";
      
      font = {
        # normal.family = "FiraCode Nerd Font Mono";
        normal.family = "JetBrainsMono Nerd Font";
        size = 14;
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

        normal = {
          black =   "#282828";
          red =     "#f43753";
          green =   "#c9d05c";
          yellow =  "#ffc24b";
          blue =    "#b3deef";
          magenta = "#d3b987";
          cyan =    "#73cef4";
          white =   "#eeeeee";
        };
        
        bright = {
          black =   "#4c4c4c";
          red =     "#f43753";
          green =   "#c9d05c";
          yellow =  "#ffc24b";
          blue =    "#b3deef";
          magenta = "#d3b987";
          cyan =    "#73cef4";
          white =   "#feffff";
        };
      };
    
    };
}
