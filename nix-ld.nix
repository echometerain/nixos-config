{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [

      # libcxx
      libpulseaudio
      stdenv.cc.cc
      # stdenv.cc.cc.lib
      
      
      # Cake Wallet
      lz4
      libgpg-error
      libepoxy
      harfbuzz

      openssl
      libXcomposite
      libXtst
      libXrandr
      libXext
      libX11
      libXfixes
      libGL
      libGLU
      libva
      pipewire
      libxcb
      libXdamage
      libxshmfence
      libXxf86vm
      libelf
      sqlite
      fuse
      portaudio

      # Required
      glib
      gtk2
      gtk3
      bzip2

      # Without these it silently fails
      libXinerama
      libXcursor
      libXrender
      libXScrnSaver
      libXi
      libSM
      libICE
      gnome2.GConf
      nspr
      nss
      cups
      libcap
      SDL2
      libusb1
      dbus-glib
      ffmpeg

      # Only libraries are needed from those two
      libudev0-shim

      # Verified games requirements
      libXt
      libXmu
      libogg
      libvorbis
      SDL
      SDL2_image
      glew_1_10
      libidn
      tbb

      # Other things from runtime
      flac
      freeglut
      libjpeg
      libpng
      libpng12
      libsamplerate
      libmikmod
      libtheora
      libtiff
      pixman
      speex
      SDL_image
      SDL_ttf
      SDL_mixer
      SDL2_ttf
      SDL2_mixer
      libappindicator-gtk2
      libdbusmenu-gtk2
      libindicator-gtk2
      libcaca
      libcanberra
      libgcrypt
      libvpx
      librsvg
      libXft
      libvdpau
      pango
      cairo
      atk
      gdk-pixbuf
      fontconfig
      freetype
      dbus
      alsa-lib
      expat
      # libjack2

      # Needed for electron
      libdrm
      mesa
      libxkbcommon
    ];
  };
}
