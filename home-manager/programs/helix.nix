{
  enable = true;
  # defaultEditor = true;
  settings = {
    theme = "base16_transparent";    # molokai github_dark_high_contrast kanagawa sonokai base16_transparent
    editor = {
      auto-save    = true;
      bufferline   = "always";
      color-modes  = true;
      cursor-shape.insert = "bar";
      file-picker  = {
        hidden     = false;
        git-ignore = true;
        git-global = true; 
      };
      indent-guides = {
        render      = true;
        character   = "⸽";
      };
      statusline = {
        left   = ["mode" "version-control" "file-name" "spinner"];
        center = [];
        right  = ["position" "selections" "diagnostics" "file-encoding" "file-line-ending" "file-type"];
        mode = {
          normal = "NORMAL";
          insert = "INSERT";
          select = "SELECT";
        };
      };
    };

    keys = {
      insert.esc = ["collapse_selection" "normal_mode"];
      normal = {
        ";" = "command_mode";
        esc = ["collapse_selection" "keep_primary_selection"];
        a = ["append_mode" "collapse_selection"];
        G = "goto_file_end";
        i = ["insert_mode" "collapse_selection"];
        # O = ["open_above" "normal_mode"];
        # o = ["open_below" "normal_mode"];
        space = {
          q = ":quit";
          # w = ":write";
          t = {
            b = ":theme base16_terminal";
            d = ":theme default";
            g = ":theme github_dark_high_contrast";
            k = ":theme kanagawa";
            m = ":theme molokai";
            n = ":theme nord";
            s = ":theme sonokai"; 
            t = ":theme tokyonight_storm";
          };
        };
      };
    };
  };
}
