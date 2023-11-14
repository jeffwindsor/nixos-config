{ pkgs, ... }: {
	home = {
		packages     = with pkgs; [ ripgrep ];
  	shellAliases = {
	    "grep"     = "rg";
	    "ar"       = "alias | rg";
	  };
	};
}
