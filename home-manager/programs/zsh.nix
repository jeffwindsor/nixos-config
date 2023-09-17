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

  sessionVariables = {
    XDG_STATE_HOME        = "$HOME/.local/state";
    XDG_DATA_HOME         = "$HOME/.local/share";
    XDG_CACHE_HOME        = "$HOME/.cache";
    XDG_CONFIG_HOME       = "$HOME/.config";
    EDITOR                = "$(which nvim)";
    LOC_SRC               = "$HOME/Source";
    LOC_JEFF              = "$HOME/Source/github.com/jeffwindsor";
    LOC_NIXOS             = "$HOME/Source/github.com/jeffwindsor/nixos-config";
    GIT_LOG_PRETTY_FORMAT = "%C(green)%h%C(auto)%d%C(reset) - %s | %C(cyan)%an %C(dim)%cr%C(reset)";
    RIPGREP_CONFIG_PATH   = "$XDG_CONFIG_HOME/ripgrep/ripgreprc";
  };

  shellAliases = {
    # directories
    "...."   = "cd ../../../";
    "..."    = "cd ../../";
    ".."     = "cd ..";
    "dot"    = "cd $XDG_CONFIG_HOME";
    "config" = "cd $XDG_CONFIG_HOME";
    "src"    = "cd $LOC_SRC";
    "hub"    = "cd $LOC_SRC/github.com";
    "jeff"   = "cd $LOC_JEFF";
    "in"     = "cd $LOC_NIXOS";
    "finb"   = "cd $LOC_JEFF/financials/gnucash/business/imports";
    "finh"   = "cd $LOC_JEFF/financials/gnucash/home/imports";
    "md"     = "cd $HOME/portable/exocortex/markdown";
    # nvim
    "v"      = "nvim";
    # bat / cat
    "cat"    = "bat --style = plain";
    # exa / ls
    "l"         = "exa -F --group-directories-first";
    "la"        = "exa -F --group-directories-first --git --all";
    "ll"        = "exa -lF --group-directories-first";
    "lla"       = "exa -lF --group-directories-first --git --all";
    "tree"      = "exa --tree --git";
    "treea"     = "exa -lF --tree --git --all";
    # grep / ripgrep
    "grep"      = "rg";
    "ar"        = "alias | rg";
    # freshfetch
    "f"         = "freshfetch";
    # git
    "gui"       = "lazygit";
    "ga"        = "git add";
    "gaa"       = "git add --all";
    "gb"        = "git branch -v";
    "gc"        = "git clone";
    "gcm"       = "git commit -m";
    "gco"       = "git checkout";
    "gd"        = "git diff --ignore-space-at-eol -b -w --ignore-blank-lines";
    "gl"        = "git log";
    #"gll"       = "git log --graph --pretty=format:\"${GIT_LOG_PRETTY_FORMAT}\" --abbrev-commit";
    "gph"       = "git push";
    "gpl"       = "git pull";
    "gr"        = "git remote -vv";
    "gs"        = "git status -sb --ignore-submodules";
    "gup"       = "git add --all && git commit -m";
    # helix
    "h"         = "helix";
    # nixos
    "change"    = "nvim -c \":args $LOC_NIXOS/**/*.nix\"";
    "clean"     = "nix-env --delete-generations +7 && nix-collect-garbage";
    "list"      = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
    "optimize"  = "nix store optimise";
    "rebuild"   = "sudo rm -rf /etc/nixos && sudo cp -fr \$LOC_NIXOS/nixos /etc && sudo cp -fr \$LOC_NIXOS/home-manager /etc/nixos && sudo nixos-rebuild switch";
    "shell"     = "nix-shell --command zsh";
    "up"        = "sudo nixos-rebuild switch --upgrade";
  };
}
