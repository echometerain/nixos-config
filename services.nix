{
  pkgs,
  # inputs,
  ...
}: {
  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # # Allow libusb to access STM32 devices.
    # udev.extraRules = ''
    #   SUBSYSTEM=="usb",        ATTRS{idVendor}=="2226", MODE="0666"
    #   SUBSYSTEM=="usb_device", ATTRS{idVendor}=="2226", MODE="0666"
    # '';

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # Configure keymap in X11
    xserver = {
      desktopManager.gnome.enable = true;
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

    # Various stuff
    thermald.enable = true;
    flatpak.enable = true;

    # Enable the auto-cpufreq service.
    auto-cpufreq.enable = true;
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
    power-profiles-daemon.enable = false;
    
    # Disable power button
    logind.powerKey = "ignore";

    # Gnome keyring
    gnome.gnome-keyring.enable = true;

    # Journald clean
    SystemdJournal2Gelf.extraOptions = "--vacuum-size=500M";

    # Hypr stuff
    hypridle.enable = true;

    # Clipboard sync
    clipboard-sync.enable = true;
    
    # Enable /usr/bin
    envfs.enable = true;

  };
}
