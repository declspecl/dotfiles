{ pkgs, ...}:
    let
        manualDots = [
            "emacs"
            "hypr"
            "kitty"
            "mako"
            "nvim"
            "wallpapers"
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
            firefox
            wofi
            hyprpaper
        ];

        file = builtins.listToAttrs (map (dot: {
            name = ".config/${dot}";
            value = {
                source = ./.dotfiles/${dot};
            };
        }) manualDots);
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        shellAliases = {
            "cls" = "clear";
        };
        initExtra = ''
            setopt ignore_eof

            function fzkill() {
                ps aux | fzf --height 40% --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -r sudo kill
            }
        '';
        sessionVariables = {
            RUST_BACKTRACE = "1";
        };
        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [
                "git"
                "zsh-autosuggestions"
                "zsh-syntax-highlighting"
            ];
            extraConfig = ''
                zstyle ":omz:update" mode reminder
                COMPLETION_WAITING_DOTS="true"
                HIST_STAMPS="yyyy-mm-dd"
                PROMPT=" %{$fg[magenta]%}%0*%{$reset_color%} %{$fg[cyan]%}%0~%{$reset_color%} $(git_prompt_info)$ "
            '';
        }
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