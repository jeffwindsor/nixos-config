{
  enable = true;
  enableBashIntegration = true; 
  enableZshIntegration = true; 

  defaultCommand = "fd --type f --hidden --ignore-file ~/.config/fdignore";
  defaultOptions = ["--height 60%" "--layout=reverse" "--info=inline"];

  # changeDirWidgetCommand = "";
  changeDirWidgetOptions = ["--preview 'exa --tree {}'"];

  # fileWidgetCommand = "";
  fileWidgetOptions = ["--preview 'bat -n --color=always {}'" "--bind 'ctrl-/:change-preview-window(down|hidden|)'"];
}
