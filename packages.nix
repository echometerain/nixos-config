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
      usbutils
      traceroute
      calc
      libqalculate
      fakeroot

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
      ghostscript
      xxd

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
      ventoy-full

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
      kitty
      rsync
      xwayland
      flatpak
      wofi
      playerctl
      logitech-udev-rules 
      seahorse
      alsa-utils

      # Hypr packages
      hyprland
      inputs.hyprland-qtutils.packages."${pkgs.system}".default
      hyprpolkitagent
      hypridle
      hyprshot
      hyprpicker
      hyprsunset

      # Hypr utils
      swaylock
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
      gnuradio
      openscad
      candy-icons
      wineWow64Packages.waylandFull
      winetricks
      pavucontrol
      grsync
      caffeine-ng
      distrobox
      appimage-run
      rclone
      flatpak-builder
      appstream
      sqlitebrowser
      quartus-prime-lite
      kmymoney
      inputs.claude-desktop.packages."${pkgs.system}".claude-desktop

      # Misc apps
      transmission_4-qt6
      calibre
      libreoffice-qt6-fresh
      discord
      firefox
      protonvpn-gui
      freeoffice
      (vivaldi.override {
        proprietaryCodecs = true;
        enableWidevine = false;
      })
      vivaldi-ffmpeg-codecs
      obsidian
      google-chrome
      
      # Web
      apacheHttpd
      php83
      openssl_3_3
      nodejs_23
      bun
      mysql-workbench
      
      # Low Level
      yosys
      # apio
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
      vale
      lunarvim
      texlab
      (texlive.combine {
        inherit
          (texlive)
          scheme-medium
          preprint
          titlesec
          enumitem
          # fancyhdr
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
      sdrpp
      rtl-sdr
      stlink-tool

      # Productivity
      simple-scan
      safeeyes
      freeplane
      pdfarranger
      authenticator
      thunderbird

      # Visual media
      zathura
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
    ];
  in
    sysPkgs ++ kdePkgs;
}
