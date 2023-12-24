
# dump gnome dconf values and convert to nix home manger file
dconf-org-gnome:
	nix-shell -p dconf2nix --run 'dconf dump /org/gnome/ | dconf2nix > dconf-org-gnome.nix'

# add flathub remote
flatpak:
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# pull git repos
repos:
	mkdir -p $HOME/Source/github.com/
	git clone git@github.com:jeffwindsor/nixos-config.git $HOME/Source/github.com/jeffwindsor/nixos-config
	git clone git@github.com:jeffwindsor/financials-home.git $HOME/Source/github.com/jeffwindsor/financials-home
	git clone git@github.com:jeffwindsor/financials-wfp.git $HOME/Source/github.com/jeffwindsor/financials-wfp
	git clone git@github.com:jeffwindsor/startpage.git $HOME/Source/github.com/jeffwindsor/startpage

# ssh keygen
keygen:
	if [[ ! -f $HOME/.ssh/github.com ]]; then
    	ssh-keygen -t ed25519 -f $HOME/.ssh/github.com -C "jeff.windsor@gmail.com"
		xdg-open https://github.com/settings/keys/ &
	fi

#  if [[ ! -f $HOME/.ssh/gitlab.gnome.org ]]; then
#      ssh-keygen -t ed25519 -f $HOME/.ssh/gitlab.gnome.org -C "jeff.windsor+gnome@gmail.com"
#      xdg-open https://gitlab.gnome.org/-/profile/keys/ &
#  fi
