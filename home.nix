{config, pkgs, ...}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hhwl";
  home.homeDirectory = "/home/hhwl";
  xdg.configHome = "/home/hhwl";

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

    # ".config/nvim" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/nvim";
    # };
    # "nvim" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/nvim";
    # };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/hypr";
    };
    ".config/wofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/wofi";
    };
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/waybar";
    };
    
    ".config/lvim/config.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/lvim/config.lua";
    };
    ".alacritty.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/.alacritty.toml";
    };
    ".zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/.zshrc";
    };
    ".bashrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/.bashrc";
    };
    ".shrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/.shrc";
    };
    ".vimrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/opt/dotfiles/.vimrc";
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

  programs.neovim.plugins = [ pkgs.vimPlugins.vim-tmux-navigator pkgs.vimPlugins.vim-sleuth ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  wayland.windowManager.hyprland.systemd.enable = false;
}
