{ pkgs }:
{
  enable = true;
  defaultEditor = true;

  extraPackages = with pkgs; [
    nil                          # nix language server
  ];
  
  settings = {
    theme = "kanagawa";    # molokai github_dark_high_contrast kanagawa sonokai base16_transparent
    
    editor = {  
      # auto save on loss of application focus
      auto-save    = true;
      
      # Show currently open buffers, only when more than one exists.
      bufferline   = "multiple";
      
      # show color background on mode status line section (INS, NOR, etc) 
      color-modes  = true;

      # Highlight all lines with a cursor
      cursorline = true;

      # Different cursors for each mode
      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      # Use relative line numbers
      line-number = "relative";
      lsp = {
        # Disable automatically popups of signature parameter help
        auto-signature-help = false;

        # Show LSP messages in the status line
        display-messages = true;
      };

      # Show a ruler at column 120
      rulers = [120];

      # Force the theme to show colors
      true-color = true;

      file-picker  = {
        hidden     = false;
        git-ignore = true;
        git-global = true; 
      };

      # vertical lines shown to left of text
      indent-guides = {
        render      = true;
        character   = "⸽";
      };

      statusline = {
        left   = [ "mode" "spinner" "file-name" "version-control" ];
        center = [ "position" "selections" ];
        right  = [ "diagnostics" "file-encoding" "file-line-ending" "file-type"];
      };
    };

    keys = {
      insert = { 
        # auto save on returning to normal mode
        esc = ["collapse_selection" "normal_mode" ":write"]; 
      };
      normal = {
        
        # short hand so I dont have to use shift to get command mode
        ";" = "command_mode";

        # Switch case of the selected text
        "`" = "switch_case";
        
        # vim like line movement
        "^" = "goto_line_start";
        "$" = "goto_line_end";
        
        # vim like append
        # a = ["append_mode" "collapse_selection"];
        
        # vim like insert
        # i = ["insert_mode" "collapse_selection"];
        
        # open lines but return to normal mode
        o = ["open_below" "normal_mode"];
        O = ["open_above" "normal_mode"];

        # vim like line select
        V = ["select_mode" "extend_to_line_bounds"];
        
        # vim like yank + yank to clipboard
        y = ["yank_main_selection_to_clipboard" "yank"];

        # vim like delete
        x = "delete_selection";
        
        # vim like esc 
        esc = ["collapse_selection" "keep_primary_selection"];
        
        space = {
          # quit
          q = ":write-quit-all";
          
          # Theme Menu
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
