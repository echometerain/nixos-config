{pkgs, ...}: {
# Programs configuration
  programs = {
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
      ];
      extraConfig = ''
        set -g mode-keys vi
        set -g mouse on
        bind c new-window -c "#{pane_current_path}"
        bind '"' split-window -c "#{pane_current_path}"
        bind | split-window -h -c "#{pane_current_path}"
        unbind '%'
        set -sg escape-time 10
        set -g repeat-time 1000
        set -g terminal-features 'XXX:RGB'
        '';
    };
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
    nm-applet.enable = true;

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
