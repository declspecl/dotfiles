{ pkgs, ... }: {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "America/Michigan";

    networking.hostName = "specnix";
    networking.networkmanager.enable = true;

    console = {
        keyMap = "us";
        font = "Lat2-Terminus16";
    };

    services.libinput.enable = true;
    services.pipewire = {
        enable =xserver. true;
        pulse.enable = true;
    };

    environment.systemPackages = with pkgs; [
        vim
        neovim
        kitty
        git
        bash
        zsh
        wget
        curl
        htop
        emacs
    ];

    programs = {
        git.enable = true;
        neovim = {
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
