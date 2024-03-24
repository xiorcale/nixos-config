{ config, pkgs, ... }:

{
  
  home.username = "xiorcale";
  home.homeDirectory = "/home/xiorcale";
  
  programs = {
    bash.enable = true;
    bat.enable = true;

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
