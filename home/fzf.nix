{ ... }: 
  let
    height = "--height=60%";
    layout = "--layout=reverse";
    info = "--info=inline";
    enter_to_edit = "--bind='enter:become(hx {})'";
    find_as_dir   = "fd --hidden --type d";
    find_as_file    = "fd --hidden --type f";
    preview_as_file = "--preview='bat --style=numbers --color=always {}'";
    preview_as_dir  = "--preview 'eza --tree --git {}'";
    preview_pager = "--bind 'ctrl-/:change-preview-window(down|hidden|)'";
  in 
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true; 
    enableZshIntegration = true; 

    # fzf
    defaultCommand = find_as_file;
    defaultOptions = [height layout info enter_to_edit preview_as_file preview_pager];
  
    # Alt - C
    changeDirWidgetCommand = find_as_dir;
    changeDirWidgetOptions = [height layout info preview_as_dir preview_pager];

    # Control - T
    fileWidgetCommand = find_as_file;
    fileWidgetOptions = [height layout info preview_as_file preview_pager];

    # Control - R
    # historyWidgetCommand = "";
    # historyWidgetOptions = [];
  };
}
