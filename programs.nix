{pkgs, ...}: {
  # Programs configuration
  programs = {
    neovim = {
      enable = true;
      configure = {
      	customRC = "source /opt/dotfiles/.vimrc";
      	packages.myVimPackage = with pkgs.vimPlugins; {
	  start = [ vim-tmux-navigator vim-sleuth ];
	};
      };
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    tmux = {
      enable = true;
      shortcut = "a";
      terminal = "screen-256color";
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        better-mouse-mode
        catppuccin
        continuum
      ];
      extraConfig = ''
        set -g mouse on
        bind | split-window -h
        unbind '%'
        set -sg escape-time 10
        set -g repeat-time 1000
        set-option -a terminal-features 'XXX:RGB'
        set -g @continuum-restore 'on'
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
