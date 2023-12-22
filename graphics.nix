{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    alacritty
    spotify
    freetube
  ];

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
    # ...
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "alacritty.desktop"
        "code.desktop"
        "spotify.desktop"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
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
