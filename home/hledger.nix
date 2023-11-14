{ pkgs, ... }: {
	home = {
		packages = with pkgs; [
	    hledger
	    hledger-ui
	    hledger-web
		];
  	shellAliases = {
      "hi"       = "hledger import";
      "hid"      = "hledger import ./--dry-run";
      "hp"       = "export LEDGER_FILE=$LOC_JEFF/financials-home/ledger && cd $LOC_JEFF/financials-home/";
      "hb"       = "export LEDGER_FILE=$LOC_JEFF/financials-wfp/ledger && cd $LOC_JEFF/financials-wfp/";
      "hunknown" = "hledger -f- -I print unknown";  # filter to "unknown" ledger account
	  };
	};
}
