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
    # gitmoji-cli  # Interactive git commits with emojis - appears broken on 23.11 as of 25.11.23
    zellij       # Terminal multiplexer
    python311Packages.gpustat  # A cleaner GPU workload monitor
    waypipe
    zoxide       # Smarter `cd` for any major shell
    du-dust      # A more intuitive `du` command
    delta        # Better `git diff` tool
    fd           # A replacement for `find`
    navi         # Interactive cheat-sheet for the command line
    gh           # GitHub CLI interface
    rust-analyzer # LSP for rust language
    gnupg1        # GPG 
    openssl      # Generating cryptographically secure passwords
    marksman     # LSP for markdown files
    nethack
  ];

  programs.git = {
  	enable = true;
  	userName = "Staneesh";
  	userEmail = "blkreasons@outlook.com";
  	signing.key = "36E9DA977A14221F";
  	signing.signByDefault = true;
    delta = {
      enable = true;   # Use `delta` package for diffs    
      options = {
        features = "decorations side-by-side line-numbers";
        syntax-theme = "Dracula";
        navigate = "true";
        light = "false";

        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-style = "bold yellow ul";
          file-decoration-style = "none";
          hunk-header-decoration-style = "cyan box ul";
        };

        line-numbers = {
          line-numbers-left-style = "cyan";
          line-numbers-right-style = "cyan";
          line-numbers-minus-style = 124;
          line-numbers-plus-style = 28;
        };
      };
    };
  };

  programs = {
    direnv = {
      enable = true;
      enableNushellIntegration = true;
    };
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
    ".config/navi/config.yaml".source = navi/config.yaml;
    ".ssh/config".source = ssh/config;
  };

  home.sessionVariables = {
    EDITOR = "helix";
    STARSHIP_CONFIG = "/home/stanisz/.config/starship/config.toml";
    _ZO_DATA_DIR = "/home/stanisz/.config/zoxide/";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
