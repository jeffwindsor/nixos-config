{...}:{ 
  programs.zsh = {
    autocd = true;
    defaultKeymap = "viins";
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    history = {
      expireDuplicatesFirst = true;
      ignorePatterns = [ "rm *" "pkill *" ];
    };

    initExtra = builtins.readFile ./shell.initExtra;
  };
}
