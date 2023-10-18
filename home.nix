{ config, pkgs, ... }:

{
  home.username = "stanisz";
  home.homeDirectory = "/home/stanisz";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
  	helix
	starship
  ];

  programs.git = {
	enable = true;
	userName = "Staneesh";
	userEmail = "blkreasons@outlook.com";
	signing.key = "FFA25D0D7797E537";
	signing.signByDefault = true;
  };


  home.file = {
    ".config/helix/config.toml".source = helix/config.toml;
  };

  home.sessionVariables = {
    EDITOR = "helix";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
