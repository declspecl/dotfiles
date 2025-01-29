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
    virtualisation.docker.enable = true;

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

        nh
        vim
        neovim
        emacs
        kitty
        thunderbird

        gitFull
        git-credential-manager
        wget
        curl
        htop
        ripgrep
        fzf
        fd
        file
        unzip
        ffmpeg
        ffmpegthumbnailer
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
            nerd-fonts.caskaydia-cove
            nerd-fonts.caskaydia-mono
            nerd-fonts.dejavu-sans-mono
            nerd-fonts.droid-sans-mono
            nerd-fonts.fira-code
            nerd-fonts.fira-mono
            nerd-fonts.geist-mono
            nerd-fonts.go-mono
            nerd-fonts.iosevka
            nerd-fonts.iosevka-term
            nerd-fonts.jetbrains-mono
            nerd-fonts.meslo-lg
            nerd-fonts.monoid
            nerd-fonts.noto
            nerd-fonts.roboto-mono
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
