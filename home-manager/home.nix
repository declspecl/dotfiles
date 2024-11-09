{ pkgs, ...}: {
    programs.home-manager.enable = true;

    home.username = "dec";
    home.homeDirectory = "/home/dec";

    home.stateVersion = "24.05";

    home.packages = with pkgs; [
        neovim
        hyprland
        firefox
        google-chrome
        emacs
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;
    };

    programs.git = {
        userName = "dec";
        userEmail = "gavind2559@gmail.com";
    };

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        xwayland.enable = true;
        systemd.enable = true;
        settings = {

        };
    };
}
