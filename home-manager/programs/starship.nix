{
  enable = true;
  enableBashIntegration = true;
  # enableNushellIntegration = true;
  enableZshIntegration = true;
  settings = {
    format = "[┌ ](blue)$directory$git_branch$git_status$jobs$nix_shell$container\n[└ ](blue)$shell$time$cmd_duration$character";

    character = {
      error_symbol   = "[:](red)";
      success_symbol = "[:](green)";
      vicmd_symbol   = "[>](yellow)"; };

    directory = {
      fish_style_pwd_dir_length = 1;
      style = "blue"; };

    git_branch = {
      style = "cyan";
      symbol = ""; };

    git_status = {
      format = "[$all_status$ahead_behind](dimmed yellow) "; };

    jobs = {
      disabled=false;
      format="[$number](dimmed blue)";
      number_threshold=1; };

    nix_shell = {
      disabled=false;
      style = "cyan"; };

    shell = {
      disabled = false;
      style = "dimmed blue";
      bash_indicator = "💣";
      fish_indicator = "🐟";
      zsh_indicator = "🧟"; };

    time = {
      disabled=false;
      format = "[$time](blue)"; };
  };
}
