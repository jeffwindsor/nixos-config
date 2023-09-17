# TODO Split out Program configs into separate files?

{ config, pkgs, ... }:{

# home manager config
  home = {
    username = "mid";
    homeDirectory = "/home/mid";
    packages = with pkgs; [
      brave                                   # backup browser
      exa                                     # ls replacement
      fd                                      # find replacement
      fortune                                 # saying that make my day
      freshfetch                              # neofetch replacement
      gcc                                     # c compiler, required for nvim+treesitter
      ripgrep                                 # grep replacement
      yadm                                    # dotfile management
      sd                                      # sed replacement
      xh                                      # curl replacement
      xplr                                    # tui file explorer
    ];
    stateVersion = "23.05";
  };

# program configuration / dotfiles
  programs = {

    alacritty = {
      enable = true;
      settings = {
	window = {
	  padding = { x = 10; y = 10; };
	  opacity = 0.98;
	  decorations = "none"; };
	cursor.style = "Block";
	font = {
	  # normal.family = "FiraCode Nerd Font Mono";
	  # normal.family = "Hack Nerd Font Mono";
	  # normal.family = "Inconsolata Nerd Font Mono";
	  # normal.family = "JetBrains Mono";
	  # normal.family = "Source Code Pro";
	  normal.family = "JetBrainsMono Nerd Font";
	  size = 12; };

	colors = {
	  # TENDER Default colors
	  primary = {
	    background = "#282828";
	    foreground = "#eeeeee"; };
	  # TENDER Normal colors
	  normal = {
	    black =   "#282828";
	    red =     "#f43753";
	    green =   "#c9d05c";
	    yellow =  "#ffc24b";
	    blue =    "#b3deef";
	    magenta = "#d3b987";
	    cyan =    "#73cef4";
	    white =   "#eeeeee"; };
	  # TENDER Bright colors
	  bright = {
	    black =   "#4c4c4c";
	    red =     "#f43753";
	    green =   "#c9d05c";
	    yellow =  "#ffc24b";
	    blue =    "#b3deef";
	    magenta = "#d3b987";
	    cyan =    "#73cef4";
	    white =   "#feffff"; };
	};
      };
    };

    bat = {
      enable = true;
      config.theme = "Nord"; };

    chromium.enable = true;

    firefox.enable = true;

    fzf = {
      enable = true;
      enableZshIntegration = true; };

    git = {
      enable = true;
      extraConfig = {
        core.excludesFile = "~/.config/git/ignore";
        pull.ff = "only";
        init.defaultBranch = "main";
        credential.helper = "cache";
        url = {
          "git@github.com:" = {
	    insteadOf = "https://github.com/"; };
        };
      };
      ignores = [
        ".git"
      ];
      userName = "Jeff Windsor";
      userEmail = "jeff.windsor@gmail.com"; };

    helix = {
      enable = true;
      languages ={};
      settings = {
	theme = "dracula";

	editor = {
	  auto-save   = true;
	  bufferline  = "always";
	  line-number = "relative";
	  mouse       = true;
	  # shell       = ["zsh", "-c"];
	  cursor-shape.insert = "bar";

	  file-picker = {
	    hidden     = false;
	    git-ignore = true;
	    git-global = true; };

	  indent-guides = {
	    render    = true;
	    character = "|"; };

	  statusline = {
	    left   = ["mode" "spinner"];
	    center = ["position" "selections"];
	    right  = ["diagnostics" "file-encoding" "file-line-ending" "file-type"];
	    mode = {
	      normal = "NORMAL";
	      insert = "INSERT";
	      select = "SELECT"; }; }; };

	keys = {
	  normal = {
	    C-u = ["kill_to_line_start"];
	    C-k = ["kill_to_line_end"];
	    esc = ["collapse_selection" "keep_primary_selection"];
	    space = {
	      q = ":quit";
	      w = ":write";
	      b = {
		b = "buffer_picker";
		a = ":buffer-close-all";
		c = ":buffer-close";
		h = ":buffer-previous";
		l = ":buffer-next";
		n = ":new"; };
	      c = {
		c = ":config-open";
		r = ":config-reload"; };
	      t = {
		k = ":theme kanagawa2";
		n = ":theme nord";
		t = ":theme tokyonight_storm"; }; }; };
	  insert.esc = ["collapse_selection" "normal_mode"];
	  select.esc = ["collapse_selection" "keep_primary_selection" "normal_mode"]; }; };

      themes = {
	kanagawa2 = let
	  seaFoam       = "#C7CCD1";    # custom lighter foreground
	  fujiWhite     = "#DCD7BA";    # default foreground
	  oldWhite      = "#C8C093";    # dark foreground, e.g. statuslines
	  sumiInk0      = "#16161D";    # dark background, e.g. statuslines, floating windows
	  sumiInk1      = "#1F1F28";    # default background
	  sumiInk3      = "#363646";    # lighter background, e.g. colorcolumns and folds
	  sumiInk4      = "#54546D";    # darker foreground, e.g. linenumbers, fold column
	  waveBlue1     = "#223249";    # popup background, visual selection background
	  waveBlue2     = "#2D4F67";    # popup selection background, search background
	  winterGreen   = "#2B3328";    # diff add background
	  winterYellow  = "#49443C";    # diff change background
	  winterRed     = "#43242B";    # diff deleted background
	  winterBlue    = "#252535";    # diff line background
	  autumnGreen   = "#76946A";    # git add
	  autumnRed     = "#C34043";    # git delete
	  autumnYellow  = "#DCA561";    # git change
	  samuraiRed    = "#E82424";    # diagnostic error
	  roninYellow   = "#FF9E3B";    # diagnostic warning
	  waveAqua1     = "#6A9589";    # diagnostic info
	  dragonBlue    = "#658594";    # diagnostic hint
	  fujiGray      = "#727169";    # comments
	  springViolet1 = "#938AA9";    # light foreground
	  oniViolet     = "#957FB8";    # statements and keywords
	  crystalBlue   = "#7E9CD8";    # functions and titles
	  springViolet2 = "#9CABCA";    # brackets and punctuation
	  springBlue    = "#7FB4CA";    # specials and builtins
	  lightBlue     = "#A3D4D5";    # not used!
	  waveAqua2     = "#7AA89F";    # types
	  springGreen   = "#98BB6C";    # strings
	  boatYellow1   = "#938056";    # not used
	  boatYellow2   = "#C0A36E";    # operators, regex
	  carpYellow    = "#E6C384";    # identifiers
	  sakuraPink    = "#D27E99";    # numbers
	  waveRed       = "#E46876";    # standout specials 1, e.g. builtin variables
	  peachRed      = "#FF5D62";    # standout specials 2, e.g. exception handling, returns
	  surimiOrange  = "#FFA066";    # constants, imports, booleans
	  katanaGray    = "#717C7C";    # deprecated
	in {
	  "ui.selection" = { bg = waveBlue2; };
	  "ui.selection.primary" = { bg = waveBlue1; };
	  "ui.background" = { fg = fujiWhite; bg = sumiInk1; };
	  "ui.linenr" = { fg = sumiInk4; };
	  "ui.linenr.selected" = { fg = roninYellow; };
	  "ui.virtual.indent-guide" = sumiInk4;
	  "ui.statusline" = { fg = oldWhite; bg = sumiInk0; };
	  "ui.statusline.inactive" = { fg = fujiGray; bg = sumiInk0; };
	  "ui.statusline.normal" = { fg = sumiInk0; bg = crystalBlue; modifiers = ["bold"]; };
	  "ui.statusline.insert" = { fg = sumiInk0; bg = autumnGreen; };
	  "ui.statusline.select" = { fg = sumiInk0; bg = oniViolet; };
	  "ui.bufferline" = { fg = oldWhite; bg = sumiInk0; };
	  "ui.bufferline.inactive" = { fg = fujiGray; bg = sumiInk0; };
	  "ui.popup" = { fg = fujiWhite; bg = sumiInk0; };
	  "ui.window" = { fg = fujiWhite; };
	  "ui.help" = { fg = fujiWhite; bg = sumiInk1; };
	  "ui.text" = fujiWhite;
	  "ui.text.focus" = { fg = fujiWhite; bg = waveBlue1; modifiers = ["bold"]; };
	  "ui.virtual" = waveBlue1;
	  "ui.cursor" = { fg = waveBlue1; bg = fujiWhite; };
	  "ui.cursor.primary" = { fg = waveBlue1; bg = seaFoam; };
	  "ui.cursor.match" = { fg = seaFoam; modifiers = ["bold"]; };
	  "ui.highlight" = { fg = fujiWhite; bg = waveBlue2; };
	  "ui.menu" = { fg = fujiWhite; bg = sumiInk1; };
	  "ui.menu.selected" = { fg = fujiWhite; bg = waveBlue1; };
	  "ui.cursorline.primary" = { bg = sumiInk3; };
	  "diagnostic" = { modifiers = ["underlined"]; };
	  "error" = samuraiRed;
	  "warning" = roninYellow;
	  "info" = waveAqua1;
	  "hint" = dragonBlue;
	  "diff.plus" = autumnGreen;
	  "diff.minus" = autumnRed;
	  "diff.delta" = autumnYellow;
	  "type" = waveAqua2;
	  "constant" = surimiOrange;
	  "constant.numeric" = sakuraPink;
	  "constant.character.escape" = springBlue;
	  "string" = springGreen;
	  "string.regexp" = boatYellow2;
	  "comment" = fujiGray;
	  "variable" = fujiWhite;
	  "variable.builtin" = waveRed;
	  "variable.parameter" = carpYellow;
	  "variable.other.member" = carpYellow;
	  "label" = springBlue;
	  "punctuation" = springViolet2;
	  "punctuation.delimiter" = springViolet2;
	  "punctuation.bracket" = springViolet2;
	  "keyword" = oniViolet;
	  "keyword.directive" = peachRed;
	  "operator" = boatYellow2;
	  "function" = crystalBlue;
	  "function.builtin" = peachRed;
	  "function.macro" = waveRed;
	  "tag" = springBlue;
	  "namespace" = surimiOrange;
	  "attribute" = peachRed;
	  "constructor" = springBlue;
	  "module" = waveAqua2;
	  "special" = peachRed;
	  "markup.heading.marker" = fujiGray;
	  "markup.heading.1" = { fg = surimiOrange; modifiers = ["bold"]; };
	  "markup.heading.2" = { fg = carpYellow; modifiers = ["bold"]; };
	  "markup.heading.3" = { fg = waveAqua2; modifiers = ["bold"]; };
	  "markup.heading.4" = { fg = springGreen; modifiers = ["bold"]; };
	  "markup.heading.5" = { fg = waveRed; modifiers = ["bold"]; };
	  "markup.heading.6" = { fg = autumnRed; modifiers = ["bold"]; };
	  "markup.list" = oniViolet;
	  "markup.bold" = { modifiers = ["bold"]; };
	  "markup.italic" = { modifiers = ["italic"]; };
	  "markup.link.url" = { fg = springBlue; modifiers = ["underlined"]; };
	  "markup.link.text" = crystalBlue;
	  "markup.quote" = seaFoam;
	  "markup.raw" = seaFoam;

	}; }; };

    lazygit. enable = true;

    nushell.enable = true;

    # NOT IN 23.05
    #ripgrep = {
    #  enable = true;
    #  arguments = [
      #  "--max-columns=120"
      #  "--max-columns-preview"
      #  "--smart-case"
      #  "--hidden"
      #  "--glob=!.git/*"
      #];
    #};

    starship = {
      enable = true;
      enableBashIntegration = true;
      # enableNushellIntegration = true;
      enableZshIntegration = true;
      settings = {
        format = "[┌ ](blue)$directory$git_branch$git_status$jobs$nix_shell$container\n[└ ](blue)$shell$time$cmd_duration$character";

        character = {
          error_symbol   = "[:](red)";
          success_symbol = "[:](green)";
          vicmd_symbol   = "[>](yellow)"; };

        directory = {
          fish_style_pwd_dir_length = 1;
          style = "blue"; };

        git_branch = {
          style = "cyan";
          symbol = ""; };

        git_status = {
          format = "[$all_status$ahead_behind](dimmed yellow) "; };

        jobs = {
          disabled=false;
          format="[$number](dimmed blue)";
          number_threshold=1; };

        nix_shell = {
          disabled=false;
          style = "cyan"; };

        shell = {
          disabled = false;
          style = "dimmed blue";
          bash_indicator = "💣";
          fish_indicator = "🐟";
          zsh_indicator = "🧟"; };

        time = {
          disabled=false;
          format = "[$time](blue)"; };
      };
    };

    tealdeer = {
      enable = true;
      settings = {
        display = {
          compact = false;
          use_pager = true; };
        updates = {
          auto_update = false; };
      };
    };

    zellij = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      # settings = { };
      };

    zsh = {
      autocd = true;
      defaultKeymap = "viins";
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      history = {
        expireDuplicatesFirst = true;
        ignorePatterns = [ "rm *" "pkill *" ]; };

      sessionVariables = {
        XDG_STATE_HOME  = "$HOME/.local/state";
        XDG_DATA_HOME   = "$HOME/.local/share";
        XDG_CACHE_HOME  = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        EDITOR          = "$(which nvim)";
        SRC             = "$HOME/Source";
        DOTFILES        = "$HOME/.config/";
        INSTALLS        = "$HOME/.config/installs";
        GIT_LOG_PRETTY_FORMAT = "%C(green)%h%C(auto)%d%C(reset) - %s | %C(cyan)%an %C(dim)%cr%C(reset)";
        RIPGREP_CONFIG_PATH   = "$XDG_CONFIG_HOME/ripgrep/ripgreprc"; };

      shellAliases = {
        # directories
        "...."      = "cd ../../../";
        "..."       = "cd ../../";
        ".."        = "cd ..";
        "dot"       = "cd $HOME/.config";
        "in"        = "cd $HOME/.config/installs";
        "src"       = "cd $HOME/Source";
        "hub"       = "cd $HOME/Source/github.com";
        "jeff"      = "cd $HOME/Source/github.com/jeffwindsor";
        "business"  = "cd $HOME/Source/github.com/jeffwindsor/financials/gnucash/business/imports";
        "home"      = "cd $HOME/Source/github.com/jeffwindsor/financials/gnucash/home/imports";
        "md"        = "cd $HOME/portable/exocortex/markdown";
        # nvim
        "v"         = "nvim";
        # bat / cat
        "cat"       = "bat --style=plain";
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
        "change"    = "nvim -c \":args $XDG_CONFIG_HOME/installs/nixos/*.nix\"";
        "clean"     = "nix-env --delete-generations +7 && nix-collect-garbage";
        "list"      = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
        "optimize"  = "nix store optimise";
        "rebuild"   = "sudo cp -r \$HOME/.config/installs/nixos/*.nix /etc/nixos/ && sudo nixos-rebuild switch";
        "shell"     = "nix-shell --command zsh";
        "up"        = "sudo nixos-rebuild switch --upgrade"; };
    };
  };
}
