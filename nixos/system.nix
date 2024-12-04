{ pkgs, ... }: {
    system.stateVersion = "24.05";

    nixpkgs.config.allowUnfree = true;

    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "US/Michigan";

    networking.hostName = "specnix";
    networking.networkmanager.enable = true;

    console = {
        keyMap = "us";
        font = "Lat2-Terminus16";
    };

    services.libinput.enable = true;
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };
    services.flatpak.enable = true;

    environment.systemPackages = with pkgs; [
        microcodeAmd

        bash
        zsh
        tmux

        libnotify
        playerctl
        pamixer
        pavucontrol
        brightnessctl
        wl-clipboard

        vim
        neovim
        libreoffice-qt6
        emacs
        kitty

        gitFull
        git-credential-manager
        wget
        curl
        htop
        ripgrep
        fzf
        fd
        unzip
        ffmpeg
        fastfetch
        sqlite
        grim
        slurp
        hyprpicker
    ];

    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            nerd-fonts.agave
            nerd-fonts.anonymice
            nerd-fonts.arimo
            nerd-fonts.aurulent-sans-mono
            nerd-fonts.bigblue-terminal
            nerd-fonts.bitstream-vera-sans-mono
            nerd-fonts.blex-mono
            nerd-fonts.caskaydia-cove
            nerd-fonts.caskaydia-mono
            nerd-fonts.code-new-roman
            nerd-fonts.comic-shanns-mono
            nerd-fonts.commit-mono
            nerd-fonts.cousine
            nerd-fonts.d2coding
            nerd-fonts.daddy-time-mono
            nerd-fonts.departure-mono
            nerd-fonts.dejavu-sans-mono
            nerd-fonts.droid-sans-mono
            nerd-fonts.envy-code-r
            nerd-fonts.fantasque-sans-mono
            nerd-fonts.fira-code
            nerd-fonts.fira-mono
            nerd-fonts.geist-mono
            nerd-fonts.go-mono
            nerd-fonts.gohufont
            nerd-fonts.hack
            nerd-fonts.hasklug
            nerd-fonts.heavy-data
            nerd-fonts.hurmit
            nerd-fonts.im-writing
            nerd-fonts.inconsolata
            nerd-fonts.inconsolata-go
            nerd-fonts.inconsolata-lgc
            nerd-fonts.intone-mono
            nerd-fonts.iosevka
            nerd-fonts.iosevka-term
            nerd-fonts.iosevka-term-slab
            nerd-fonts.jetbrains-mono
            nerd-fonts.lekton
            nerd-fonts.liberation
            nerd-fonts.lilex
            nerd-fonts.martian-mono
            nerd-fonts.meslo-lg
            nerd-fonts.monaspace
            nerd-fonts.monofur
            nerd-fonts.monoid
            nerd-fonts.mononoki
            nerd-fonts.mplus
            nerd-fonts.noto
            nerd-fonts.open-dyslexic
            nerd-fonts.overpass
            nerd-fonts.profont
            nerd-fonts.proggy-clean-tt
            nerd-fonts.recursive-mono
            nerd-fonts.roboto-mono
            nerd-fonts.shure-tech-mono
            nerd-fonts.sauce-code-pro
            nerd-fonts.space-mono
            nerd-fonts.symbols-only
            nerd-fonts.terminess-ttf
            nerd-fonts.tinos
            nerd-fonts.ubuntu
            nerd-fonts.ubuntu-mono
            nerd-fonts.ubuntu-sans
            nerd-fonts.victor-mono
            nerd-fonts.zed-mono
        ];
    };

    programs = {
        zsh.enable = true;
        git.enable = true;
        neovim = {
            enable = true;
            defaultEditor = true;
        };
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
        hyprlock.enable = true;
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
        };
    };

    services.hypridle.enable = true;

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
}
