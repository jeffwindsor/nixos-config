{ ...}: { 
  programs.lf = {
    enable = true;
    # cmdKeybindings = {};
    commands = {
      get-mime-type = "%xdg-mime query filetype \"$f\"";
      open = "$$OPENER $f";
    };
    # extraConfig = {};
    # keybindings = {};
    # settings = {};
    # previewer = {
    #   source = ;
    #   keybinding = "p";
    # };
  };
}
