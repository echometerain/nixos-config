{
  pkgs,
  inputs,
  ...
}: {
  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Allow libusb to access STM32 devices.
    udev.extraRules = ''
      SUBSYSTEM=="usb",        ATTRS{idVendor}=="2226", MODE="0666"
      SUBSYSTEM=="usb_device", ATTRS{idVendor}=="2226", MODE="0666"
    '';

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;

    # Configure keymap in X11
    xserver = {
      xkb.layout = "us";
      xkb.variant = "";
    };

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [pkgs.brlaser pkgs.brgenml1lpr pkgs.brgenml1cupswrapper];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # Sound configuration
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    # Xampp stuff
    httpd = {
      enable = true;
      enablePHP = true;
      enablePerl = true;
      phpPackage = inputs.phps.packages.x86_64-linux.php74;
      virtualHosts = {
        localhost = {
          documentRoot = "/opt/htdocs";
        };
      };
    };

    # Various stuff
    thermald.enable = true;
    safeeyes.enable = true;
    flatpak.enable = true;

    # Enable the auto-cpufreq service.
    # auto-cpufreq.enable = true;
    auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };

    # MySQL
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    # Journald clean
    SystemdJournal2Gelf.extraOptions = "--vacuum-size=500M";
  };
}
