{pkgs, ...}: {
  environment.systemPackages = let
    sysPkgs = with pkgs; [
      # Nix utils
      home-manager
      nixpkgs-fmt
      alejandra
      patchelf
      nil
      nix-ld

      # CLI utils
      xsel
      fastfetch
      vim
      zsh
      neovim
      bat

      # Media and networking CLI utils
      ffmpeg-full
      wget
      nmap
      networkmanager
      unzip
      unar
      ntfs3g
      aria2
      axel

      # Filesystem CLI utils
      caligula
      fzf
      lf
      lshw
      cron
      htop
      fd
      auto-cpufreq

      # CLI fun
      fortune
      cmatrix
      lolcat
      cowsay

      # Graphical system utils
      gparted
      bleachbit
      fsearch
      qdirstat
      terminator
      rsync
      xwayland
      glaxnimate
      movit
      flatpak
      wofi

      # Hyprland utils
      hyprland
      hyprlock
      eww
      waybar

      # Hack the box
      burpsuite
      openvpn3
      exploitdb
      metasploit

      # User utils
      candy-icons
      wineWow64Packages.waylandFull
      winetricks
      pavucontrol
      grsync
      caffeine-ng
      distrobox
      appimage-run
      rclone
      logitech-udev-rules
      flatpak-builder
      appstream

      # Misc apps
      transmission_4-qt6
      calibre
      libreoffice-qt6-fresh
      discord
      zoom-us
      freefilesync
      firefox
      chromium
      gramps
      subtitlecomposer
      pot
      zed-editor
      protonvpn-gui
      xournalpp
      calc

      # Programming tools
      vscode
      apacheHttpd
      mysql-workbench
      github-desktop
      arduino-ide
      git-lfs
      docker
      docker-client
      git
      gh
      bless
      bun
      cargo
      rustycli
      micromamba
      stlink
      stlink-gui
      cmake
      gnumake
      gitkraken

      # Libraries
      php83
      openssl_3_3
      nodejs_22
      gcc14
      python3
      llvmPackages_18.libcxxClang
      temurin-bin
      rustc
      go
      texliveSmall

      # Learning
      anki-bin
      qalculate-qt
      obsidian
      foliate
      remnote

      # Productivity
      gnome.simple-scan
      safeeyes
      freeplane
      pdfarranger
      authenticator
      thunderbird

      # Visual media
      aseprite
      vlc
      mpv
      krita
      mpvScripts.uosc
      gimp-with-plugins
      krita-plugin-gmic
      obs-studio
      freetube
      yt-dlp

      # Audio media
      audacity
      handbrake
      mixxx
      reaper
      musescore
      picard
      libsForQt5.soundkonverter
      yabridge
    ];
    kdePkgs = with pkgs.kdePackages; [
      plasma-desktop
      kate
      kolourpaint
      kdeconnect-kde
      qtimageformats
      kimageformats
      kaccounts-providers
      kaccounts-integration
      kdenlive
      spectacle
      ark
      dolphin
      kmenuedit
      okular
      kalgebra
    ];
  in
    sysPkgs ++ kdePkgs;
}
