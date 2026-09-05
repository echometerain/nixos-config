{pkgs, inputs, ...}: {
  environment.systemPackages = let
    sysPkgs = with pkgs; [

      # Nix utils
      home-manager
      alejandra
      patchelf
      nixd
      gnome-boxes

      # CLI essentials
      wl-clipboard
      wl-clip-persist
      killall
      usbutils
      pciutils
      tcptraceroute
      traceroute
      net-tools
      calc
      libqalculate
      fakeroot
      libnotify

      # Misc CLI
      zsh-fzf-tab
      jq
      tealdeer
      navi
      fastfetch
      ripgrep
      xxd
      zoxide
      graphviz

      # Networking CLI
      wget
      nmap
      ntfs3g
      aria2
      axel
      iw
      openconnect
      cloudflared

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
      flatpak
      (rofi.override {
        plugins = with pkgs; [
          rofi-calc
        ];
      })
      playerctl
      logitech-udev-rules 
      alsa-utils

      # Hypr packages
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
      pavucontrol
      gnome-tweaks
      grsync
      caffeine-ng
      appimage-run
      rclone
      flatpak-builder
      appstream
      quartus-prime-lite
      ghdl
      verible
      usb-blaster-udev-rules
      kmymoney
      thunar
      # inputs.claude-desktop.packages."${stdenv.hostPlatform.system}".claude-desktop
      claude-code
      opencode

      # Misc apps
      transmission_4-qt6
      calibre
      libreoffice-qt6-fresh
      proton-vpn
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
      mamba-cpp

      # Text
      obsidian
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
      openshot-qt
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
      ffmpegthumbs
      kde-cli-tools
      kdegraphics-thumbnailers
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
      # kbuildsycoca6, without which KService can never rebuild its application
      # catalog and Dolphin is stuck on a stale, empty ~/.cache/ksycoca6_*.
      kservice
      kio-admin
      okular
      kalgebra
      kmenuedit
    ];
  in
    sysPkgs ++ kdePkgs;
}
