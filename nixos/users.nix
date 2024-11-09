{ pkgs, ... }: {
    users.users.dec = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" ];
        shell = pkgs.zsh;
        # packages managed through home-manager
    };
}
