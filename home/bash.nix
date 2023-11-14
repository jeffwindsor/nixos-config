{ ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''    
      # git commit with a default comment of 'Refactor'
      function git-commit(){
        git commit -m "''${1:-Refactor}"
      }

      function git-add-commit-push(){
        git add --all && git-commit "$1" && git push
      }

      # pretty git log using format set in .zshenv: GIT_LOG_PRETTY_FORMAT. Max count defaults to 10
      function git-log-graph(){
        git log --graph --pretty=format:"''${GIT_LOG_PRETTY_FORMAT}" --abbrev-commit --max-count="''${1:-10}"
      }

      # find all directories ending in .git (including hidden and ignored listings)
      function git-find-dirs(){
        fd '^.git$' "$1" -HItd --max-depth 4 | sed 's/.git\/$//'
      }

      # apply git command to current directory contents
      function git-all(){
        echo "git $1 on sub-directories"
        find . -maxdepth 1 -type d -exec git -C {} "$1" \;
        # ls | xargs -I{} echo git -C {} $1
      }

      # prompt user to select from list of git directories under $2 and if user selects one, execute command $1 on it
      function exec-on-git-repos() {
        local result
        result=$(git-find-dirs "$2" | fzf --reverse)
        [ -n "$result" ] && "$1" "$result"
      }

      # git clone from git hub to my source directory
      function ghc(){
        git clone git@github.com:"$1" "$SRC"/github.com/"$1"
      }    
      '';
  };
	
  home.sessionVariables = {
      LOC_SRC               = "$HOME/Source";
      OPENER                = "xgd-open";
      XDG_CACHE_HOME        = "$HOME/.cache";
      XDG_CONFIG_HOME       = "$HOME/.config";
      XDG_DATA_HOME         = "$HOME/.local/share";
      XDG_STATE_HOME        = "$HOME/.local/state";
    };
  
  home.shellAliases = {
    "...."     = "cd ../../../";
    "..."      = "cd ../../";
    ".."       = "cd ..";
    "dot"      = "cd $LOC_NIXOS";
    "config"   = "cd $XDG_CONFIG_HOME";
    "src"      = "cd $LOC_SRC";
    "srcs"     = "exec-on-git-repos cd \$LOC_SRC";
    "hub"      = "cd $LOC_SRC/github.com";
    "hubs"     = "exec-on-git-repos cd \$LOC_SRC/github.com";
    "jeff"     = "cd $LOC_JEFF";
    "in"       = "cd $LOC_NIXOS";
    "finb"     = "cd $LOC_JEFF/financials/gnucash/business/imports";
    "finh"     = "cd $LOC_JEFF/financials/gnucash/home/imports";
    "md"       = "cd $HOME/portable/exocortex/markdown";
  };    
}
