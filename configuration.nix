# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./packages.nix
    ./programs.nix
    ./nix-ld.nix
    ./services.nix
    inputs.home-manager.nixosModules.default
    # inputs.musnix.nixosModules.musnix
  ];

  virtualisation.docker.enable = true;

  # Bootloader.
  boot = {
    loader = {
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    tmp.useTmpfs = true;
    initrd.systemd.emergencyAccess = true;
    # blacklistedKernelModules = [ "dvb_usb_rtl28xxu" ];
  };

  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    extra-substituters = ["https://hyprland.cachix.org"];
    extra-trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
    persistent = true;
  };

  # Custom packages
  nixpkgs.config = {
    allowUnfree = true;
  };
  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = ["en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8"];
    extraLocaleSettings = {
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.hhwl = {
      isNormalUser = true;
      description = "hhwl";
      extraGroups = ["plugdev" "networkmanager" "wheel" "dialout" "audio" "scanner" "lp" "docker"];
    };
  };

  # Enable home-manager
  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      hhwl = import ./home.nix;
    };
  };

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
    SUDO_EDITOR = "nvim";
  };

  # GNOME's IBus integration sets these, but IBus 1.5.30+ deprecates them.
  # Unset so IBus doesn't show the "please unset QT_IM_MODULE/GTK_IM_MODULE" notification.
  environment.variables = {
    GTK_IM_MODULE = lib.mkForce "";
    QT_IM_MODULE = lib.mkForce "";
    XMODIFIERS = lib.mkForce "";
  };

  # Font configuration
  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
    nerd-fonts.hack
    # (nerdfonts.override {fonts = ["Hack"];})
    # siji
  ];

  hardware = {
    enableAllFirmware = true;
    firmware = [ pkgs.wireless-regdb ];

    sane = {
      brscan5.enable = true;
      enable = true;
    };
    # Logitech
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };

    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    rtl-sdr.enable = true;

    # Hardware sound configuration
    bluetooth = {
      enable = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  security = {
    polkit = {
      enable = true;
    };
    rtkit.enable = true;
    pam.services.hyprland.enableGnomeKeyring = true;
    # pam.services.hypr.enableGnomeKeyring = true;
  };

  # Networking configuration
  networking = {

    # # Enable networking
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # wireless.userControlled.enable = true;
    networkmanager = {
      enable = true;
      # wifi.backend = "iwd";
    };

    # Open ports in the firewall.
    firewall = {
      enable = true;
      allowedTCPPorts = [80 443]; # http https
      allowedUDPPorts = [443];
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
    };
  };

  # Misc configuration
  powerManagement.enable = true;
  xdg.portal.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Swap configuration
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true; # Optional: needed if you want to run Windows 11 VMs
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    gedit # text editor
    gnome-characters
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ]);

  # uwsm sets XDG_MENU_PREFIX="hyprland-" for the systemd user session, but no
  # hyprland-applications.menu exists. KService then builds an empty application
  # catalog, so Dolphin shows no file associations. Point it at the GNOME menu.
  environment.etc."xdg/menus/hyprland-applications.menu".source =
    "${pkgs.gnome-menus}/etc/xdg/menus/gnome-applications.menu";

  xdg.mime.defaultApplications = {
    "audio/*" = "umpv.desktop";
    "video/*" = "umpv.desktop";
    "image/*" = "org.gnome.Loupe.desktop";
    "application/epub+zip" = "com.github.johnfactotum.Foliate.desktop";
    "application/json" = "org.kde.kate.desktop";
    "application/octet-stream" = "org.kde.kate.desktop";
    "application/pdf" = "okularApplication_pdf.desktop";
    "application/vnd.amazon.mobi8-ebook" = "com.github.johnfactotum.Foliate.desktop";
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "writer.desktop";
    "application/x-extension-*" = "zen-twilight.desktop";
    "application/x-mobipocket-ebook" = "com.github.johnfactotum.Foliate.desktop";
    "application/xhtml+xml" = "zen-twilight.desktop";
    "application/zip" = "org.kde.ark.desktop";
    "message/rfc822" = "userapp-Thunderbird-61D2D3.desktop";
    "text/csv" = "calc.desktop";
    "text/html" = "zen-twilight.desktop";
    "text/plain" = "org.kde.kate.desktop";
    "text/x-lua" = "org.kde.kate.desktop";
    "text/x-python" = "org.kde.kate.desktop";
    "x-scheme-handler/about" = "zen-twilight.desktop";
    "x-scheme-handler/chrome" = "zen-twilight.desktop";
    "x-scheme-handler/claude-cli" = "claude-code-url-handler.desktop";
    "x-scheme-handler/http" = "zen-twilight.desktop";
    "x-scheme-handler/https" = "zen-twilight.desktop";
    "x-scheme-handler/mailto" = "userapp-Thunderbird-61D2D3.desktop";
    "x-scheme-handler/mid" = "userapp-Thunderbird-61D2D3.desktop";
    "x-scheme-handler/unknown" = "zen-twilight.desktop";
    "x-scheme-handler/webcal" = "zen-twilight.desktop";
    "x-scheme-handler/net.thunderbird" = "userapp-Thunderbird-SUGGS3.desktop";
  };

  qt.enable = true;

  # plasma-integration reads colors, widget style and icon theme from
  # kdeglobals. Without a Plasma session nothing else writes it, so build it
  # from Breeze's own Breeze Dark color scheme.
  #
  # It lives in /etc/xdg (the first entry of XDG_CONFIG_DIRS) so it acts as a
  # cascade *default*, leaving ~/.config/kdeglobals a real, writable file. A
  # store symlink there is fatal: KConfig canonicalises the path before creating
  # its "<file>.lock", so the lock lands in the read-only store and fails, and
  # any save touching kdeglobals then aborts KConfig::sync() outright -- taking
  # the app's own rc file down with it ("Couldn't lock global file: dolphinrc").
  environment.etc."xdg/kdeglobals".source = pkgs.concatText "kdeglobals" [
    "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors"
    (pkgs.writeText "kdeglobals-theme" ''
      [KDE]
      widgetStyle=Breeze

      [Icons]
      Theme=candy-icons
    '')
  ];

  # # Chinese language support
  # i18n.inputMethod = {
  #   enabled = "fcitx5";
  #   fcitx5 = {
  #     waylandFrontend = true;
  #     plasma6Support = true;
  #     addons = with pkgs; [
  #       fcitx5-chinese-addons
  #       fcitx5-mozc
  #       fcitx5-gtk # Fcitx5 gtk im module and glib based dbus client library
  #       fcitx5-rime
  #     ];
  #   };
  # };

  # # VST support
  # musnix.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
