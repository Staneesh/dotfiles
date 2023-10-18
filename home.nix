{ config, pkgs, ... }:

{
  home.username = "stanisz";
  home.homeDirectory = "/home/stanisz";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = [
    # pkgs.hello
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    .config/helix/source = dotfiles/helix;
  };

  home.sessionVariables = {
    EDITOR = "helix";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
