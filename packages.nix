{pkgs, inputs, ...}: {
  environment.systemPackages = let
    sysPkgs = with pkgs; [
      
      # Nix utils
      home-manager
      alejandra
      patchelf
      nixd
      nix-ld

      # CLI essentials
      zsh
      wl-clipboard
      wl-clip-persist
      killall
      usbutils
      pciutils
      net-tools
      calc
      libqalculate
      fakeroot

      # Misc CLI
      jq
      tealdeer
      navi
      fastfetch
      bat
      ripgrep
      xxd
      zoxide
      graphviz

      # Networking CLI
      wget
      nmap
      networkmanager
      ntfs3g
      aria2
      axel
      iw
      openconnect

      # Filesystem CLI
      file
      caligula
      fzf
      lf
      lshw
      cron
      btop
      fd
      unzip
      unar

      # Fun CLI
      hollywood
      fortune
      cmatrix
      lolcat
      cowsay
      pipes-rs
      cool-retro-term
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
      (rofi.override {
        plugins = with pkgs; [
          rofi-calc
        ];
      })
      playerctl
      logitech-udev-rules 
      seahorse
      alsa-utils

      # Hypr packages
      hyprland
      inputs.hyprland-qtutils.packages."${stdenv.hostPlatform.system}".default
      hyprpolkitagent
      hyprshot
      hyprpicker
      hyprsunset
      hyprpaper

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
      thunderbird
      pandoc
      bulky
      gnuradio
      candy-icons
      octaveFull
      pavucontrol
      gnome-tweaks
      grsync
      caffeine-ng
      appimage-run
      rclone
      flatpak-builder
      appstream
      sqlitebrowser
      quartus-prime-lite
      ghdl
      verible
      usb-blaster-udev-rules
      kmymoney
      thunar
      # inputs.claude-desktop.packages."${stdenv.hostPlatform.system}".claude-desktop
      claude-code

      # Misc apps
      transmission_4-qt6
      calibre
      libreoffice-qt6-fresh
      firefox
      proton-vpn
      freeoffice
      onlyoffice-desktopeditors
      inputs.zen-browser.packages."${stdenv.hostPlatform.system}".twilight
      google-chrome
      
      # Web
      libyaml
      nodejs_24
      bun
      ruby
      deno
      
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
      bfg-repo-cleaner
      lazygit
      git-lfs
      git
      gh
      
      # Python
      uv
      inputs.newpkgs.legacyPackages."${stdenv.hostPlatform.system}".micromamba
      # micromamba

      # Text
      vale
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
      libxcb-cursor
      ffmpeg-full
      temurin-bin
      monero-gui

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

      # Visual media
      subtitlecomposer
      zathura
      vlc
      (mpv.override {scripts = [mpvScripts.uosc];})
      inkscape
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
      yabridge
      vital

    ];
    kdePkgs = with pkgs.kdePackages; [
      breeze
      breeze-icons
      breeze-gtk
      ffmpegthumbs
      kdegraphics-thumbnailers
      kde-cli-tools
      plasma-workspace
      partitionmanager
      kate
      kolourpaint
      kdeconnect-kde
      qtimageformats
      kimageformats
      kdenlive
      kcachegrind
      spectacle
      ark
      dolphin
      kio-admin
      kmenuedit
      okular
      kalgebra
    ];
  in
    sysPkgs ++ kdePkgs;
}
