{
  autocd = true;
  defaultKeymap = "viins";
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;
  history = {
    expireDuplicatesFirst = true;
    ignorePatterns = [ "rm *" "pkill *" ];
  };

  initExtra = builtins.readFile ./shell/git.functions;
}
