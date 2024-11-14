{ pkgs, config, ...}:
    let
        manualDots = [
            { name = "emacs";   mutable = true;  }
            { name = "hypr";    mutable = false; }
            { name = "kitty";   mutable = false; }
            { name = "mako";    mutable = false; }
            { name = "nvim";    mutable = true;  }
            { name = "wofi";    mutable = false; }
            { name = "waybar";  mutable = false; }
            { name = "wlogout"; mutable = false; }
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
            awscli

            lua-language-server
            vscode-langservers-extracted

            wofi
            mako
            waybar
            wlogout
            hyprpaper
            nwg-look
            nemo
            xfce.thunar
            vlc

            firefox
            vesktop
            vscode
            jetbrains.idea-community
            spotify
            figma-linux

            pipes
            cava
            cbonsai
            cmatrix
            asciiquarium
            sl
            btop
            lolcat
            tty-clock
            figlet
        ];

        file = builtins.listToAttrs (map (dot: {
            name = ".config/${dot.name}";
            value = {
                source = if dot.mutable then (config.lib.file.mkOutOfStoreSymlink ./${dot.name}) else ./${dot.name};
            };
        }) manualDots);
    };

    programs = {
        zsh = {
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

                PROMPT=' %{$fg[magenta]%}%0*%{$reset_color%} %{$fg[cyan]%}%0~%{$reset_color%} $(git_prompt_info)$ '
            '';
            sessionVariables = {
                RUST_BACKTRACE = "1";
            };
            oh-my-zsh = {
                enable = true;
                theme = "robbyrussell";
                plugins = [ "git" "python" "man" ];
                extraConfig = ''
                    zstyle ':omz:update' mode reminder
                    COMPLETION_WAITING_DOTS='true'
                    HIST_STAMPS='yyyy-mm-dd'
                '';
            };
        };
        direnv = {
            enable = true;
            nix-direnv.enable = true;
            enableZshIntegration = true;
        };
        git = {
            enable = true;
            userName = "dec";
            userEmail = "gavind2559@gmail.com";
            package = pkgs.gitFull;
            extraConfig = {
                init.defaultBranch = "main";
                pull.rebase = true;
                credential = {
                    helper = "manager";
                    credentialStore = "cache";
                    "https://github.com".username = "declspecl";
                };
            };
        };
    };

    gtk = {
        enable = true;
        theme = {
            name = "gruvbox-dark";
            package = pkgs.gruvbox-dark-gtk;
        };
        iconTheme = {
            name = "oomox-gruvbox-dark";
            package = pkgs.gruvbox-dark-icons-gtk;
        };
        cursorTheme = {
            name = "Bibata-Modern-Ice";
            package = pkgs.bibata-cursors;
            size = 20;
        };
        gtk3 = {
            bookmarks = [
                "file://${config.home.homeDirectory}/Downloads Downloads"
                "file://${config.home.homeDirectory}/Pictures Pictures"
                "file://${config.home.homeDirectory}/Videos Videos"
                "file://${config.home.homeDirectory}/programming programming"
                "file:///mnt mnt"
            ];
        };
    };
}
