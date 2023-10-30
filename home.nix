{ config, pkgs, ... }:

{
  home.username = "stanisz";
  home.homeDirectory = "/home/stanisz";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
  	nushell      # Shell program
  	starship     # Command prompt
  	helix        # Text editor
  	bottom       # Process and system monitor
  	wget         # Utility program for downloading web content
    clang        # C++ compiler
    clang-tools  # C++ LSP (clangd)
    taplo        # TOML LSP, linter and formatter
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
    ".config/helix/languages.toml".source = helix/languages.toml;
    ".config/bottom/bottom.toml".source = bottom/bottom.toml;
  };

  home.sessionVariables = {
    EDITOR = "helix";
    STARSHIP_CONFIG = "/home/stanisz/.config/starship/config.toml";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
