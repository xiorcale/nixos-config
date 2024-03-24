{
  inputs,
  config, 
  pkgs, 
  ... 
}: {

  imports = [
    inputs.nur.nixosModules.nur
  ];
  
  home.username = "xiorcale";
  home.homeDirectory = "/home/xiorcale";

  programs = {
    bash.enable = true;
    bat.enable = true;

    firefox = {
      enable = true;

      policies = {
        DisplayMenuBar = "never";
        Homepage.StartPage = "previous-session";
        OfferToSaveLogins = false;
      };

      profiles.xiorcale= {
        isDefault = true;
         
        extensions = [
          config.nur.repos.rycee.firefox-addons.bitwarden
          config.nur.repos.rycee.firefox-addons.proton-pass
          config.nur.repos.rycee.firefox-addons.ublock-origin
          config.nur.repos.rycee.firefox-addons.windscribe
        ];

        search.default = "DuckDuckGo";
      };
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;  
    };
    
    git = {
      enable = true;
      userName = "xiorcale";
      userEmail = "quentin.vaucher@protonmail.com";
    };

    helix = {
      enable = true;
      defaultEditor = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
    };

    vscode.enable = true;
  };

  # Gnome configuration
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      natural-scroll = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>w" ];
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
