{ config, pkgs, ... }:

{
  home.username = "stanisz";
  home.homeDirectory = "/home/stanisz";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
	nushell
	starship
  	helix
	bottom
	wget
  ];

  programs.git = {
	enable = true;
	userName = "Staneesh";
	userEmail = "blkreasons@outlook.com";
	signing.key = "FFA25D0D7797E537";
	signing.signByDefault = true;
  };

  home.file = {
    ".config/nushell/env.nu".source = nushell/env.nu;
    ".config/nushell/config.nu".source = nushell/config.nu;
    ".config/starship/config.toml".source = starship/config.toml;
    ".config/helix/config.toml".source = helix/config.toml;
    ".config/bottom/bottom.toml".source = bottom/bottom.toml;
  };

  home.sessionVariables = {
    EDITOR = "helix";
    STARSHIP_CONFIG = "/home/stanisz/.config/starship/config.toml";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
