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
        normal.family = "JetBrainsMono Nerd Font";
        size = 12;
      };

      colors = with config.colorScheme.colors; {
        primary = {
          background = "#${base00}";  # base00 - Default Background
          foreground = "#${base05}";  # base05 - Default Foreground, Caret, Delimiters, Operators
        };
        normal = {
          black =   "#${base00}";     # base00 - Default Background
          blue =    "#${base0D}";     # base0D - Functions, Methods, Attribute IDs, Headings
          cyan =    "#${base0C}";     # base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
          green =   "#${base0B}";     # base0B - Strings, Inherited Class, Markup Code, Diff Inserted
          magenta = "#${base0E}";     # base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
          red =     "#${base08}";     # base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
          white =   "#${base05}";
          yellow =  "#${base0A}";     # base0A - Classes, Markup Bold, Search Text Background
        };
        bright = {
          black =   "#${base03}";     # base03 - Comments, Invisibles, Line Highlighting
          blue =    "#${base0D}";
          cyan =    "#${base0C}";
          green =   "#${base0B}";
          magenta = "#${base0E}";
          red =     "#${base08}";
          white =   "#${base07}";
          yellow =  "#${base0A}";
        };
      };
      draw_bold_text_with_bright_colors = false;
    };
  };
}
