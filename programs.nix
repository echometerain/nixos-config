{pkgs, ...}: {
  # Programs configuration
  programs = {
    neovim = {
      enable = true;
      configure = {
      	customRC = "source /dotfiles/nvim/init.vim";
      	packages.myVimPackage = with pkgs.vimPlugins; {
	  start = [ pkgs.vimPlugins.vim-tmux-navigator pkgs.vimPlugins.vim-sleuth ];
	};
      };
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    tmux = {
      enable = true;
      shortcut = "a";
      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        better-mouse-mode
        catppuccin
        resurrect
        continuum
      ];
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g default-terminal 'screen-256color'
	set-option -a terminal-features 'XXX:RGB'
        set -g mouse on
        bind | split-window -h
        unbind '%'
        set -sg escape-time 10
        set -g repeat-time 1000
        new
      '';
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
