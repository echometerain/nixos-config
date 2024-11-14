{pkgs, ...}: {
  # Programs configuration
  programs = {
    neovim = {
      enable = true;
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
        set -g default-terminal 'screen-256color'
        set -g mouse on
        bind | split-window -h
        unbind '%'
        set-option -sa terminal-features ',XXX:RGB'
        set -sg escape-time 10
        set -g repeat-time 1000
        set -g @continuum-restore 'on'
      '';
    };

    # Hyprland configuration
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    # programs.hyprlock.enable = true;
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
