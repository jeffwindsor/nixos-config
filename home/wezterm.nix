
{ ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")
      local config = wezterm.config_builder()
      local act = wezterm.action

      -- =============================================================

      config.color_scheme = "Tokyo Night (Gogh)"
      config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
      config.font_size = 14.0
      config.inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.5,
      }
      config.window_background_opacity = 0.98
      config.window_close_confirmation = "NeverPrompt"

      -- =============================================================

      config.keys = {
        -- PANES
        --  CLOSE
        { key = "x", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) }, -- CLOSE
        --  MOVE
        { key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
        { key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
        { key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
        { key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
        --  SPLIT
        { key = "h", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Left" }) },
        { key = "k", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Up" }) },
        { key = "l", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Right" }) },
        { key = "j", mods = "CTRL|ALT", action = act.SplitPane({ direction = "Down" }) },
        --  RESIZE
        { key = "h", mods = "CTRL|ALT|SUPER", action = act.AdjustPaneSize({ "Left", 1 }) },
        { key = "l", mods = "CTRL|ALT|SUPER", action = act.AdjustPaneSize({ "Right", 1 }) },
        { key = "k", mods = "CTRL|ALT|SUPER", action = act.AdjustPaneSize({ "Up", 1 }) },
        { key = "j", mods = "CTRL|ALT|SUPER", action = act.AdjustPaneSize({ "Down", 1 }) },

      }

      return config

    ''
  };
}

