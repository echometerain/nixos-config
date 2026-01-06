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


        set -gF window-status-style "bg=#{@thm_surface_1},fg=#{@thm_fg}"
        set -gF window-status-current-style "bg=#{@thm_peach},fg=#{@thm_crust}"

        set -g window-status-format " #T | #I "
        set -g window-status-current-format " #T | #I "

        set -g status-left ""
        set -g  status-right "#{E:@catppuccin_status_application}"
        set -ag status-right "#{E:@catppuccin_status_session}"
        set -ag status-right "#{E:@catppuccin_status_host}"
        set -ag status-right "#{E:@catppuccin_status_date_time}"
      '';
    };
    neovim = {
      enable = true;
      # configure = {
      #   customRC = "source /opt/dotfiles/.vimrc";
      #   packages.myVimPackage = with pkgs.vimPlugins; {
      #     start = [
      #       vim-tmux-navigator
      #       vim-sleuth
      #     ];
      #   };
      # };
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
