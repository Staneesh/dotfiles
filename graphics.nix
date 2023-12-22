{ config, pkgs, ... }:

{
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    firefox
    alacritty
    spotify
    freetube
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
