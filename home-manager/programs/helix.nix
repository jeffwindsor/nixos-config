{ ... }: {
  programs.helix = {
    enable = true;
    languages ={};
    themes.kanagawa2 = import ./helix/theme-kanagawa2.nix;
    settings = {
      theme = "kanagawa2";

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
        insert.esc = ["collapse_selection" "normal_mode"];
        normal = {
          C-h = "select_prev_sibling";
          C-j = "shrink_selection";
          C-k = "expand_selection";
          C-l = "select_next_sibling";
          esc = ["collapse_selection" "keep_primary_selection"];
          "#" = ["move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_prev"];
          "$" = "goto_line_end";
          "%" = "match_brackets";
          "*" = ["move_char_right" "move_prev_word_start" "move_next_word_end" "search_selection" "search_next"];
          "^" = "goto_first_nonwhitespace";
          "{" = ["goto_prev_paragraph" "collapse_selection"];
          "}" = ["goto_next_paragraph" "collapse_selection"];
          "0" = "goto_line_start";

          a = ["append_mode" "collapse_selection"];
          # B = ["move_prev_long_word_start" "collapse_selection"];
          # b = ["move_prev_word_start" "collapse_selection"];
          C = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection" "insert_mode"];
          D = ["extend_to_line_end" "yank_main_selection_to_clipboard" "delete_selection"];
          d = {
            a    = ["select_textobject_around"];
            d    = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection"];
            down = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            G    = ["select_mode" "extend_to_line_bounds" "goto_last_line" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            g    = {
              g  = ["select_mode" "extend_to_line_bounds" "goto_file_start" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            };
            i    = ["select_textobject_inner"];
            j    = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            k    = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            s    = ["surround_delete"];
            t    = ["extend_till_char"];
            up   = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "delete_selection" "normal_mode"];
            W    = ["move_next_long_word_start" "yank_main_selection_to_clipboard" "delete_selection"];
            w    = ["move_next_word_start" "yank_main_selection_to_clipboard" "delete_selection"];
          };
          # E = ["move_next_long_word_end" "collapse_selection"];
          # e = ["move_next_word_end" "collapse_selection"];
          G = "goto_file_end";
          i = ["insert_mode" "collapse_selection"];
          j = "move_line_down";
          k = "move_line_up";
          O = ["open_above" "normal_mode"];
          o = ["open_below" "normal_mode"];
          p = ["paste_clipboard_after" "collapse_selection"];
          P = ["paste_clipboard_before" "collapse_selection"];
          S = "surround_add";
          u = ["undo" "collapse_selection"];
          V = ["select_mode" "extend_to_line_bounds"];
          # W = ["move_next_long_word_start" "move_char_right" "collapse_selection"];
          # w = ["move_next_word_start" "move_char_right" "collapse_selection"];
          x = "delete_selection";
          Y = ["extend_to_line_end" "yank_main_selection_to_clipboard" "collapse_selection"];
          y = {
            y    = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "normal_mode" "collapse_selection"];
            j    = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            down = ["select_mode" "extend_to_line_bounds" "extend_line_below" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            k    = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            up   = ["select_mode" "extend_to_line_bounds" "extend_line_above" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            G    = ["select_mode" "extend_to_line_bounds" "goto_last_line" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            w    = ["move_next_word_start" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            W    = ["move_next_long_word_start" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            g    = {
              g  = ["select_mode" "extend_to_line_bounds" "goto_file_start" "extend_to_line_bounds" "yank_main_selection_to_clipboard" "collapse_selection" "normal_mode"];
            };
          };
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
        select = {
          C-a = ["append_mode" "collapse_selection"];
          tab = ["insert_mode" "collapse_selection"];
          esc = ["collapse_selection" "keep_primary_selection" "normal_mode"];
          "$" = "goto_line_end";
          "%" = "match_brackets";
          "0" = "goto_line_start";
          "^" = "goto_first_nonwhitespace";
          "{" = ["extend_to_line_bounds" "goto_prev_paragraph"];
          "}" = ["extend_to_line_bounds" "goto_next_paragraph"];

          a = "select_textobject_around";
          C = ["goto_line_start" "extend_to_line_bounds" "change_selection"];
          D = ["extend_to_line_bounds" "delete_selection" "normal_mode"];
          d = ["yank_main_selection_to_clipboard" "delete_selection"];
          G = "goto_file_end";
          i = "select_textobject_inner";
          j = ["extend_line_down" "extend_to_line_bounds"];
          k = ["extend_line_up" "extend_to_line_bounds"];
          P = "paste_clipboard_before";
          p = "replace_selections_with_clipboard";
          S = "surround_add";
          u = ["switch_to_lowercase" "collapse_selection" "normal_mode"];
          U = ["switch_to_uppercase" "collapse_selection" "normal_mode"];
          x = ["yank_main_selection_to_clipboard" "delete_selection"];
          Y = ["extend_to_line_bounds" "yank_main_selection_to_clipboard" "goto_line_start" "collapse_selection" "normal_mode"];
          y = ["yank_main_selection_to_clipboard" "normal_mode" "flip_selections" "collapse_selection"];
        };
      };
    };
  };
}
