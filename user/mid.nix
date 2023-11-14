{ home-manager, pkgs,  ... }: {

  # User
  time.timeZone = "America/Los_Angeles";

  users.users.mid = {
    description  = "The Middle Way";
    extraGroups  = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    # shell        = pkgs.zsh;
  };

}


