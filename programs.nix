{pkgs, ...}: {
  # Programs configuration
  programs = {
    neovim = {
      enable = true;
      configure = {
      	customRC = "source /opt/dotfiles/.vimrc";
      	packages.myVimPackage = with pkgs.vimPlugins; {
	  start = [
            vim-tmux-navigator
            vim-sleuth
          ];
	};
      };
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    # Hyprland configuration
    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
    hyprlock.enable = true;

    kdeconnect.enable = true;
    openvpn3.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    mtr.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    firefox = {
      enable = true;
    };
  };
}
