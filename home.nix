{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hhwl";
  home.homeDirectory = "/home/hhwl";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/kitty";
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/hypr";
    };
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/waybar";
    };
    ".config/zathura" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/zathura";
    };

    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/nvim";
    };
    ".zshrc".text = ''
      # Intentionally empty -- see programs.zsh in /etc/nixos/programs.nix
    '';
    ".bashrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/.bashrc";
    };
    ".shrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/.shrc";
    };
    ".vimrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/.vimrc";
    };

    # Hyprland iterates ~/.icons at startup and aborts if it is not a
    # directory. Keep it pointed at the real icon dir.
    ".icons" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/share/icons";
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hhwl/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };

  # Breeze Dark widgets/colors, Candy icons.
  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };

    # GTK 4 ignores gtk-theme-name; Home Manager applies the theme by
    # importing its CSS into gtk-4.0/gtk.css instead.
    gtk4.theme = config.gtk.theme;
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "Breeze";
  };

  # plasma-integration reads colors, widget style and icon theme from
  # kdeglobals. Without a Plasma session nothing else writes it, so build it
  # from Breeze's own Breeze Dark color scheme.
  xdg.configFile."kdeglobals".source = pkgs.concatText "kdeglobals" [
    "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors"
    (pkgs.writeText "kdeglobals-theme" ''
      [KDE]
      widgetStyle=Breeze

      [Icons]
      Theme=candy-icons
    '')
  ];

  # wayland.windowManager.hyprland.systemd.enable = false;

  services.wlsunset = {
    enable = true;
    sunrise = "08:00";
    sunset = "18:30";
    temperature = {
      day = 5500;
      night = 4500;
    };
  };
}
