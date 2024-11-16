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
      pipes-rs

      # Graphical system utils
      gparted
      bleachbit
      fsearch
      qdirstat
      terminator
      alacritty
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
      sqlitebrowser

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
      protonvpn-gui
      xournalpp
      calc
      freeoffice
      ghostscript
      matlab
      brave
      obsidian
      kicad
      nextcloud-client

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
      cmake
      gnumake
      gdb
      lunarvim
      pulseview
      netbeans
      seer

      # Libraries
      php83
      openssl_3_3
      nodejs_22
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
      gnome.simple-scan
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
    ];
  in
    sysPkgs ++ kdePkgs;
}
