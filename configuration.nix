# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./programs.nix
    ./nix-ld.nix
    ./services.nix
    inputs.home-manager.nixosModules.default
    # inputs.musnix.nixosModules.musnix
  ];

  # Bootloader.
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    # blacklistedKernelModules = [ "dvb_usb_rtl28xxu" ];
  };

  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  nix.optimise.automatic = true;

  # Custom packages
  nixpkgs = {
    config.allowUnfree = true;
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
      extraGroups = ["plugdev" "networkmanager" "wheel" "dialout" "audio" "scanner" "lp"];
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
    XDG_RUNTIME_DIR = "/run/user/$UID";
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
    SUDO_EDITOR = "lvim";
  };

  # Font configuration
  fonts.packages = with pkgs; [
    corefonts
    vistafonts
    # nerd-fonts.hack
    (nerdfonts.override {fonts = ["Hack"];})
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
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      settings.General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };
  security = {
    polkit = {
      enable = true;
    };
    rtkit.enable = true;
    pam.services.hypr.enableGnomeKeyring = true;
  };

  # Networking configuration
  networking = {
    hostName = "moving-castle"; # Define your hostname.

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
      allowedUDPPorts = [80 443];
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
  # virtualisation.docker.enable = true;
  powerManagement.enable = true;
  xdg.portal.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  qt.platformTheme = "kde";

  # Swap configuration
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
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
