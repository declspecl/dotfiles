{ pkgs, ...}:
    let
        manualDots = [
            "emacs"
            "hypr"
            "kitty"
            "mako"
            "nixpkgs"
            "nvim"
            "wofi"
            "waybar"
            "wlogout"
        ];
    in
{
    programs.home-manager.enable = true;

    home = {
        username = "dec";
        homeDirectory = "/home/dec";
        stateVersion = "24.05";

        packages = with pkgs; [
            clang
            gnumake
            cmake
            rustup
            jdk
            python3
            nodejs

            wofi
            mako
            waybar
            wlogout
            hyprpaper

            firefox
            vscode
            jetbrains.idea-community

            pipes
            cava
            cbonsai
            cmatrix
        ];

        file = builtins.listToAttrs (map (dot: {
            name = ".config/${dot}";
            value = {
                source = ./${dot};
            };
        }) manualDots);
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            "cls" = "clear";
        };
        initExtra = ''
            setopt ignore_eof

            function fzkill() {
                ps aux | fzf --height 40% --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -r sudo kill
            }

            PROMPT=" %{$fg[magenta]%}%0*%{$reset_color%} %{$fg[cyan]%}%0~%{$reset_color%} $(git_prompt_info)$ "
        '';
        sessionVariables = {
            RUST_BACKTRACE = "1";
        };
        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [ "git" ];
            extraConfig = ''
                zstyle ":omz:update" mode reminder
                COMPLETION_WAITING_DOTS="true"
                HIST_STAMPS="yyyy-mm-dd"
            '';
        };
    };

    programs.git = {
        enable = true;
        userName = "dec";
        userEmail = "gavind2559@gmail.com";
        extraConfig = {
            pull.rebase = true;
        };
    };
}
