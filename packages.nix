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

      # CLI essentials
      lsof
      zsh
      wl-clipboard
      wl-clip-persist
      killall

      # Misc CLI
      jq
      tealdeer
      navi
      fastfetch
      page
      bat
      lazygit
      asciinema
      asciinema-agg
      ripgrep
      tmux
      tmuxinator
      ghostscript

      # Networking CLI
      wget
      nmap
      networkmanager
      unzip
      unar
      ntfs3g
      aria2
      axel
      iw

      # Filesystem CLI
      file
      caligula
      fzf
      lf
      lshw
      cron
      btop
      fd
      gnome-keyring

      # Fun CLI
      hollywood
      fortune
      cmatrix
      lolcat
      cowsay
      pipes-rs
      cool-retro-term
      vimgolf
      cava

      # Graphical system utils
      gparted
      bleachbit
      fsearch
      qdirstat
      alacritty
      rsync
      xwayland
      flatpak
      wofi
      playerctl

      # Hypr packages
      hyprland
      inputs.hyprland-qtutils.packages."${pkgs.system}".default
      hyprpolkitagent
      xdg-desktop-portal-hyprland
      hyprlock
      hypridle
      hyprshot
      hyprpicker
      hyprsunset

      # Hypr utils
      wlogout
      waybar
      nwg-look
      dunst
      blueman
      networkmanagerapplet
      cliphist
      brightnessctl
      htop

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
      protonvpn-gui
      freeoffice
      matlab
      brave
      obsidian
      
      # Web
      apacheHttpd
      php83
      openssl_3_3
      nodejs_23
      bun
      mysql-workbench
      
      # Low Level
      ghex
      cmake
      gnumake
      gdb
      clang
      clang-tools
      pulseview
      seer
      valgrind
      gcc14
      
      # Rust
      rustc
      cargo
      cargo-watch
      rustfmt
      rustycli
      rust-analyzer
      
      # Git
      github-desktop
      git-lfs
      git
      gh
      
      # Python
      pipx
      micromamba
      (python3.withPackages (python-pkgs:
        with python-pkgs; [
          pynvim
          numpy
        ]))
      poetry
      
      # Text
      lunarvim
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

      # Misc tooling
      vscode
      arduino-ide
      movit
      xcb-util-cursor-HEAD
      ffmpeg-full
      temurin-bin
      netbeans

      # Learning
      anki-bin
      qalculate-qt
      foliate
      remnote
      logisim-evolution
      gramps

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
      xournalpp
      rnote

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
      kdenlive
      spectacle
      ark
      dolphin
      kmenuedit
      okular
      kalgebra
      kwallet-pam
    ];
  in
    sysPkgs ++ kdePkgs;
}
