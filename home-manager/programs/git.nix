{
  enable = true;

  extraConfig = {
    core.excludesFile = "~/.config/git/ignore";
    pull.ff = "only";
    init.defaultBranch = "main";
    credential.helper = "cache";
    url."git@github.com:".insteadOf = "https://github.com/"; };

  ignores = [ ".git" ];

  userName = "Jeff Windsor";
  userEmail = "jeff.windsor@gmail.com";
}

