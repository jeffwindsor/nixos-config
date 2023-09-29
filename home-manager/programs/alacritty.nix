{ config, ... }: {
   programs.alacritty = {
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
        # normal.family = "Hack Nerd Font Mono";
        # normal.family = "Inconsolata Nerd Font Mono";
        # normal.family = "JetBrains Mono";
        # normal.family = "Source Code Pro";
        normal.family = "JetBrainsMono Nerd Font";
        size = 12;
      };

      colors = with config.colorScheme.colors; {
        primary = {
          background = "#${base00}";
          foreground = "#${base05}";
        };
        normal = {
          black =   "#${base00}";
          blue =    "#${base0D}";
          cyan =    "#${base0C}";
          green =   "#${base0B}";
          magenta = "#${base0E}";
          red =     "#${base08}";
          white =   "#${base05}";
          yellow =  "#${base0A}";
        };
        bright = {
          black =   "#${base03}";
          blue =    "#${base0D}";
          cyan =    "#${base0C}";
          green =   "#${base0B}";
          magenta = "#${base0E}";
          red =     "#${base08}";
          white =   "#${base07}";
          yellow =  "#${base0A}";
        };
      };
    };
  };
}
