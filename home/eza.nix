{ pkgs, ... }: {
	home = {
		packages     = with pkgs; [ eza ];
  	shellAliases = {
	    "ll"       = "eza -lF --group-directories-first";
	    "lla"      = "eza -lF --group-directories-first --git --all";
	    "tree"     = "eza --tree --git";
	    "treea"    = "eza -lF --tree --git --all";
	  };
	};
}
