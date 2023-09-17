{
  enable = true;
  languages ={};
  settings = {
    theme = "dracula";

    editor = {
      auto-save   = true;
      bufferline  = "always";
      line-number = "relative";
      mouse       = true;
      # shell       = ["zsh", "-c"];
      cursor-shape.insert = "bar";

      file-picker = {
        hidden     = false;
        git-ignore = true;
        git-global = true; };

      indent-guides = {
        render    = true;
        character = "|"; };

      statusline = {
        left   = ["mode" "spinner"];
        center = ["position" "selections"];
        right  = ["diagnostics" "file-encoding" "file-line-ending" "file-type"];
        mode = {
          normal = "NORMAL";
          insert = "INSERT";
          select = "SELECT";
        };
      };
    };

    keys = {
      normal = {
        C-u = ["kill_to_line_start"];
        C-k = ["kill_to_line_end"];
        esc = ["collapse_selection" "keep_primary_selection"];
        space = {
          q = ":quit";
          w = ":write";
          b = {
            b = "buffer_picker";
            a = ":buffer-close-all";
            c = ":buffer-close";
            h = ":buffer-previous";
            l = ":buffer-next";
            n = ":new";
          };
          c = {
            c = ":config-open";
            r = ":config-reload";
          };
          t = {
            k = ":theme kanagawa2";
            n = ":theme nord";
            t = ":theme tokyonight_storm";
          };
        };
      };
      insert.esc = ["collapse_selection" "normal_mode"];
      select.esc = ["collapse_selection" "keep_primary_selection" "normal_mode"];
    };
  };

  themes.kanagawa2 = import ./helix-theme-kanagawa2.nix;
}
