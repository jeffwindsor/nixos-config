{ ... }: {
  programs.fzf = {
    enable = true;
    enableBashIntegration = true; 
    enableZshIntegration = true; 

    # fzf
    defaultCommand = "fd --type f --hidden --ignore-file ~/.config/fdignore";
    defaultOptions = ["--height 60%" "--layout=reverse" "--info=inline"];

    # Alt - C
    changeDirWidgetCommand = "fd --type d --ignore-file ~/.config/fdignore";
    changeDirWidgetOptions = ["--preview 'exa --tree {}'"];

    # Control - T
    fileWidgetCommand = "fd --type f --hidden --ignore-file ~/.config/fdignore";
    fileWidgetOptions = ["--preview 'bat -n --color=always {}'" "--bind 'ctrl-/:change-preview-window(down|hidden|)'"];

    # Control - R
    # historyWidgetCommand = "";
    # historyWidgetOptions = [];
  };
}
