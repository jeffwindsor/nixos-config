# eza not in home manager yet so rolling my own config
{ pkgs, ... }: {
	
	home.shellAliases = {
    "ll"       = "eza -lF --group-directories-first";
    "lla"      = "eza -lF --group-directories-first --git --all";
    "tree"     = "eza --tree --git";
    "treea"    = "eza -lF --tree --git --all";
  };
	
	home.packages = with pkgs; [ eza ];
}
