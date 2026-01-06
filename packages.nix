{pkgs, inputs, ...}: {
  environment.systemPackages = let
    sysPkgs = with pkgs; [

      # HTN
      qemu
      dialog

      # Nix utils
      home-manager
      nixpkgs-fmt
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
      page
      bat
      lazygit
      asciinema
      asciinema-agg
      ripgrep
      ghostscript
      xxd
      zoxide
      graphviz
      bear

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
      # ventoy-full

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
      # spyder
      bulky
      gnuradio
      candy-icons
      octaveFull
      # wineWow64Packages.stableFull
      # winetricks
      # flutter
      # geary
      pavucontrol
      # gnome-shell
      gnome-tweaks
      grsync
      caffeine-ng
      # distrobox
      x11docker
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
      qwen-code
      xfce.thunar
      # inputs.claude-desktop.packages."${pkgs.system}".claude-desktop

      # Misc apps
      transmission_4-qt6
      calibre
      libreoffice-qt6-fresh
      firefox
      protonvpn-gui
      freeoffice
      inputs.zen-browser.packages."${stdenv.hostPlatform.system}".twilight
      # (vivaldi.override {
      #   proprietaryCodecs = true;
      #   vivaldi-ffmpeg-codecs = pkgs.vivaldi-ffmpeg-codecs;
      # })
      # obsidian
      google-chrome
      
      # Web
      libyaml
      apacheHttpd
      nodejs_24
      bun
      ruby
      solargraph
      deno
      
      # Low Level
      yosys
      # apio
      ghex
      cmake
      gnumake
      gdb
      clang
      # clang-tools
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
      # github-desktop
      git-lfs
      git
      gh
      
      # Python
      pipx
      micromamba
      # (python3.withPackages (python-pkgs:
      #   with python-pkgs; [
      #     pynvim
      #     numpy
      #   ]))
      # poetry
      
      # Text
      vale
      # lunarvim
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
      neomutt

      # Visual media
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

      # Coins
      wasabiwallet
      eigenwallet
      monero-gui
      xmrig

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
