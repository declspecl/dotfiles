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
        emacs
        kitty
        libreoffice-qt6-fresh

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
            nerdfonts
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
