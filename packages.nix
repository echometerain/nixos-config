{pkgs, inputs, ...}: {
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
      wl-clipboard
      tealdeer
      navi
      fastfetch
      zsh
      vimgolf
      page
      bat
      lf
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
      jq
      htop
      cava
      tmux
      tmuxinator

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
      iw

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
      hollywood
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
      playerctl

      # Hyprland utils
      hyprland
      inputs.hyprland-qtutils.packages."${pkgs.system}".default
      xdg-desktop-portal-hyprland
      hyprlock
      hypridle
      hyprshot
      hyprpicker
      hyprsunset
      wlogout
      waybar
      libsForQt5.qt5ct
      qt6ct
      nwg-look
      dunst
      blueman
      networkmanagerapplet

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
      logisim-evolution
      calibre
      libreoffice-qt6-fresh
      discord
      firefox
      chromium
      gramps
      protonvpn-gui
      xournalpp
      rnote
      calc
      freeoffice
      ghostscript
      matlab
      brave
      obsidian

      # Programming tools
      vscode
      apacheHttpd
      mysql-workbench
      github-desktop
      arduino-ide
      git-lfs
      git
      gh
      ghex
      bun
      cargo
      cargo-watch
      rustfmt
      rustycli
      rust-analyzer
      micromamba
      cmake
      gnumake
      gdb
      lunarvim
      pulseview
      netbeans
      seer
      valgrind
      dbeaver-bin

      # Libraries
      xcb-util-cursor-HEAD
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
      partitionmanager
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
