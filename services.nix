{inputs, ...}: {
  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;

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
    printing.enable = true;
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
    thermald.enable = true;
    safeeyes.enable = true;
    flatpak.enable = true;
  };
}