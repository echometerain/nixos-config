{pkgs, lib, ...}: {
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions = {
        enable = true;
        highlightStyle = "fg=#ff00ff,bold,underline";
      };

      ohMyZsh = {
        enable = true;
        theme = "powerlevel10k/powerlevel10k";
        plugins = [
          "git"
          "colored-man-pages"
          "tmux"
          "you-should-use"
        ];
        customPkgs = with pkgs; [
          zsh-powerlevel10k
          zsh-you-should-use
        ];
        preLoaded = ''
          typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
          if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi
        '';
      };

      interactiveShellInit = lib.mkAfter ''
        [ -r ~/.shrc ] && source ~/.shrc
        source /opt/dotfiles/.p10k.zsh
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

        ### Fix slowness of pastes with zsh-syntax-highlighting.zsh
        pasteinit() {
          OLD_SELF_INSERT=''${''${(s.:.)widgets[self-insert]}[2,3]}
          zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
        }

        pastefinish() {
          zle -N self-insert $OLD_SELF_INSERT
        }
        zstyle :bracketed-paste-magic paste-init pasteinit
        zstyle :bracketed-paste-magic paste-finish pastefinish
        ### Fix slowness of pastes

        # Guarded: /etc/zshrc is read by root's shell too, and neither the xkcd
        # greeter nor the tmux autostart should fire for root. The tty test
        # covers `zsh -ic ...`, which is interactive (so this file is sourced)
        # but has no terminal, so tmux would fail with "open terminal failed".
        if [[ $UID != 0 ]] && [ -t 0 ] && [ -t 1 ]; then
          if [ "$(nmcli networking connectivity check)" != "none" -a ! -z "''${KITTY_PID+x}" ]; then
              XKCD_JSON="$(curl -s https://xkcd.com/info.0.json)"
              NUM="$(echo $XKCD_JSON | jq -r '.num')"
              if [ "$(cat ~/.last_xkcd 2>/dev/null)" != "$NUM" ]; then
                  echo $NUM > ~/.last_xkcd
                  echo $XKCD_JSON | jq -r '.safe_title'
                  kitten icat --align left "$(echo $XKCD_JSON | jq -r '.img')"
                  echo $XKCD_JSON | jq -r '.alt'
                  TMUX="blocked"
              fi
          fi

          if [ "$TMUX" = "" ]; then
              if [ ! -z "$(pidof kitty)" -a "$(pidof tmux)" != "" ]; then
                  tmux attach-session
              else
                  tmux
              fi
          elif [ "$TMUX" != "blocked" ]; then
              fortune
          fi
        fi

        export MAMBA_ROOT_PREFIX="$HOME/micromamba"
        command -v mamba > /dev/null && \
          eval "$(mamba shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" | sed 's/\.mamba-wrapped/mamba/g')"

        eval "$(zoxide init zsh)"

        setopt hist_find_no_dups
      '';
    };

    # Replaces the fzf-zsh-plugin oh-my-zsh plugin.
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
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
        set -g terminal-features 'xterm-kitty:RGB'


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
