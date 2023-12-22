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
}
