{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    thunderbird
    spotify
    freetube
    signal-desktop
    libreoffice-qt
    hunspell             # For libreoffice
    hunspellDicts.en_US  # For libreoffice
    hunspellDicts.pl_PL  # For libreoffice
    texstudio
    texliveFull
    vlc
    zoom-us
    gnome.gnome-boxes
    evince # gnome pdf viewer
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 18;
      };
      window = {
        decorations = "None";
        startup_mode = "Fullscreen";
      };
      mouse = {
        hide_when_typing = true;
      };
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "freetube.desktop"
        "org.gnome.Nautilus.desktop"
        "Alacritty.desktop"
        "code.desktop"
        "signal-desktop.desktop"
        "spotify.desktop"
      ];
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/window-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/mutter" = {
      edge-tiling = true;
      center-new-windows = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = ["<Alt>1"];
      switch-to-workspace-2 = ["<Alt>2"];
      switch-to-workspace-3 = ["<Alt>3"];
      switch-to-workspace-4 = ["<Alt>4"];
      move-to-workspace-1 = ["<Shift><Alt>1"];
      move-to-workspace-2 = ["<Shift><Alt>2"];
      move-to-workspace-3 = ["<Shift><Alt>3"];
      move-to-workspace-4 = ["<Shift><Alt>4"];
      close = ["<Shift><Alt>c"];
    };

    "org/gnome/desktop/wm/preferences" = {
      resize-with-right-button = true;
      mouse-button-modifier = "<Alt>";
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
    };

    "org/gnome/desktop/session" = {
      idle-delay = 0;
    };

    "org/gnome/desktop/notifications" = {
      show-in-lock-screen = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      speed = 0.10;
      accel-profile = "flat";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-saver-profile-on-low-battery = false;
      power-button-action = "hibernate";
      sleep-inactive-battery-type = "nothing";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom0" = {
      binding = "<Shift><Alt>Return";
      command = "alacritty";
      name = "Launch Alacritty";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      search = ["<Alt>p"];
      custom-keybindings = [ 
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      yzhang.markdown-all-in-one
      rust-lang.rust-analyzer
      eamodio.gitlens
      oderwat.indent-rainbow
      vadimcn.vscode-lldb
      serayuzgur.crates
    ];
  };

  home.sessionVariables.GTK_THEME = "palenight";
}
