{pkgs, ...}: {
  environment.systemPackages = let
    sysPkgs = with pkgs; [
      # Nix utils
      home-manager
      nixpkgs-fmt
      alejandra
      patchelf
      nixd
      nix-ld

      # CLI utils
      wl-clipboard-rs
      tealdeer
      navi
      fastfetch
      zsh
      neovim
      nvimpager
      vimgolf
      bat
      lf
      tmux
      lazygit
      asciinema
      asciinema-agg
      nushell
      killall
      file
      lazygit
      clipboard-jh
      cliphist
      wl-clip-persist
      brightnessctl
      ripgrep

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
      gnome-keyring

      # CLI fun
      fortune
      cmatrix
      lolcat
      cowsay
      pipes-rs
      cool-retro-term

      # Graphical system utils
      gparted
      bleachbit
      fsearch
      qdirstat
      alacritty
      rsync
      xwayland
      movit
      flatpak
      wofi
      networkmanagerapplet
      playerctl

      # Hyprland utils
      hyprland
      hyprlock
      eww
      waybar
      libsForQt5.qt5ct
      qt6ct
      nwg-look
      dunst

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
      sqlitebrowser

      # Misc apps
      transmission_4-qt6
      calibre
      libreoffice-qt6-fresh
      discord
      firefox
      chromium
      gramps
      # subtitlecomposer
      protonvpn-gui
      xournalpp
      rnote
      calc
      freeoffice
      ghostscript
      matlab
      brave
      obsidian
      kicad

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
      ghex
      bun
      cargo
      rustycli
      micromamba
      cmake
      gnumake
      gdb
      # lunarvim
      pulseview
      netbeans
      seer
      valgrind

      # Libraries
      php83
      openssl_3_3
      nodejs_23
      gcc14
      (python3.withPackages (python-pkgs:
        with python-pkgs; [
          pynvim
          numpy
        ]))
      poetry
      llvmPackages.libcxxClang
      clang-tools
      temurin-bin
      rustc
      go
      (texlive.combine {
        inherit
          (texlive)
          scheme-small
          chktex
          latexmk
          titlesec
          preprint
          marvosym
          enumitem
          hyperref
          fancyhdr
          babel
          ;
      })

      # Learning
      anki-bin
      qalculate-qt
      foliate
      remnote

      # Productivity
      simple-scan
      safeeyes
      freeplane
      pdfarranger
      authenticator
      thunderbird

      # Visual media
      vlc
      (mpv.override {scripts = [mpvScripts.uosc];})
      krita
      gimp-with-plugins
      krita-plugin-gmic
      obs-studio
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
      vital
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
      plasma-integration
      kwallet-pam
    ];
  in
    sysPkgs ++ kdePkgs;
}
