{ ... }: {
  programs.git = {
    enable = true;
    extraConfig = {
      core.excludesFile = "~/.config/git/ignore";
      pull.ff = "only";
      init.defaultBranch = "main";
      credential.helper = "cache";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
    ignores = [ ".git" ];
    userName = "Jeff Windsor";
    userEmail = "jeff.windsor@gmail.com";
  };

	home.sessionVariables = {
    GIT_LOG_PRETTY_FORMAT = "%C(green)%h%C(reset) - %s%C(cyan) | %an%C(dim) | %ch %C(auto)%d%C(reset)";
  };
  
  home.shellAliases = {
    "g"        = "lazygit";
    "ga"       = "git add";
    "gaa"      = "git add --all";
    # "gau"      = "git add -u";
    # "gb"       = "git branch -v";
    # "gc"       = "git clone";
    "gcm"      = "git-commit";
    # "gco"      = "git checkout";
    "gd"       = "git diff --ignore-space-at-eol -b -w --ignore-blank-lines -U0";
    "gl"       = "git log";
    "gll"      = "git-log-graph";
    "gph"      = "git push";
    "gpl"      = "git pull";
    # "gpls"     = "git-all pull";
    "gr"       = "git remote -vv";
    "gs"       = "git status -sb --ignore-submodules";
    "gup"      = "git-add-commit-push";
  };
}

