{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        vim
        kitty
        git
        zsh
        wget
        curl
        htop
        localstack
        jdk
        
    ];

    virtualisation.docker = {
        enable = true;
        enableOnBoot = false;
    };

    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
