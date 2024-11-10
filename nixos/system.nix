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

    environment.systemPackages = with pkgs; [
        microcodeAmd

        bash
        zsh

        libnotify
        pamixer
        pavucontrol
        brightnessctl
        wl-clipboard

        vim
        neovim
        emacs
        kitty

        git
        git-credential-manager
        wget
        curl
        htop
        ripgrep
        fzf
        fd
        ffmpeg
        fastfetch
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
    };

    services.hypridle.enable = true;

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
}
