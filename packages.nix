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
      fzf
      wget
      xclip
      neofetch
      vim
      zsh
      neovim
      ffmpeg-full
      nmap
      cron
      caligula
      lolcat
      cowsay
      lshw

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
      fcitx5
      rclone

      # Mullvad VPN
      mullvad-vpn
      mullvad
      mullvad-browser
      mullvad-closest

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
      mongodb-compass
      bless
      bun
      python311Packages.pip

      # Libraries
      php83
      openssl_3_3
      nodejs_22
      gcc14
      python3
      llvmPackages_18.libcxxClang
      temurin-bin

      # Learning
      anki-bin
      qalculate-qt
      obsidian
      foliate
      fortune
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
    ];
  in
    sysPkgs ++ kdePkgs;
}
