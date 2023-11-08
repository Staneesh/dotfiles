{ config, pkgs, ... }:

{
  home.username = "stanisz";
  home.homeDirectory = "/home/stanisz";

  home.stateVersion = "23.05";

  nixpkgs.config = {
    allowUnfree = true;
    cudaSupport = true;
  };

  home.packages = with pkgs; [
  	nushell      # Shell program
  	starship     # Command prompt
  	helix        # Text editor
  	bottom       # Process and system monitor
  	wget         # Utility program for downloading web content
    clang        # C++ compiler
    clang-tools  # C++ LSP (clangd)
    taplo        # TOML LSP, linter and formatter
    nodePackages.gitmoji-cli  # Interactive git commits with emojis
    zellij       # Terminal multiplexer
    python311Packages.gpustat  # A cleaner GPU workload monitor
    waypipe
    zoxide       # Smarter `cd` for any major shell
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
    ".config/starship/init.nu".source = starship/init.nu;
    ".config/starship/config.toml".source = starship/config.toml;
    ".config/zoxide/init.nu".source = zoxide/init.nu;
    ".config/helix/config.toml".source = helix/config.toml;
    ".config/helix/languages.toml".source = helix/languages.toml;
    ".config/bottom/bottom.toml".source = bottom/bottom.toml;
    ".config/zellij/config.kdl".source = zellij/config.kdl;
    ".config/zellij/layouts/almop.kdl".source = zellij/layouts/almop.kdl;
  };

  home.sessionVariables = {
    EDITOR = "helix";
    STARSHIP_CONFIG = "/home/stanisz/.config/starship/config.toml";
    _ZO_DATA_DIR = "/home/stanisz/.config/zoxide/";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
