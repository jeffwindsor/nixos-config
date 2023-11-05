{ ... }: {
    enable = true;
    settings = {
      
      window = {
        padding = { x = 10; y = 10; };
        opacity = 0.98;
        decorations = "none";
      };
      
      cursor.style = "Block";
      
      font = {
        # normal.family = "FiraCode Nerd Font Mono";
        normal.family = "JetBrainsMono Nerd Font";
        size = 12;
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
    
      # draw_bold_text_with_bright_colors = false;
    };
}
