{ ... }: 
  let
    height = "--height=60%";
    layout = "--layout=reverse";
    info = "--info=hidden";
    enter_to_edit = "--bind='enter:become(hx {})'";
    find = "fd --hidden";
    only_dirs = " --type d";
    only_files = " --type f";
    preview_as_file = "--preview='bat --style=numbers --color=always {}'";
    preview_as_dir = "--preview 'eza --tree --git {}'";
    preview_pager = "--bind 'ctrl-/:change-preview-window(down|hidden|)'";
  in 
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true; 

    # fzf
    defaultCommand = find;
    defaultOptions = [height layout info];
  
    # Alt - C
    changeDirWidgetCommand = (find + only_dirs);
    changeDirWidgetOptions = [height layout info preview_as_dir preview_pager];

    # Control - T
    fileWidgetCommand = (find + only_files);
    fileWidgetOptions = [height layout info preview_as_file preview_pager enter_to_edit];

    # Control - R
    # historyWidgetCommand = "";
    # historyWidgetOptions = [];
  };
}
