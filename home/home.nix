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
        stateVersion = "25.11";

        sessionVariables = {
            NIXOS_OZONE_WL = "1";
            PATH = "$HOME/.cargo/bin:$HOME/.local/bin:$PATH";
        };

        packages = with pkgs; [
            # Packages are now handled by Arch (pacman/yay) in bootstrap.sh
            # Nix is used ONLY for configuration (dotfiles & templating)
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
                ls = "eza";
                cls = "clear";
                hmbs = "couleur render && home-manager switch";
                couleur-build = "cd ~/.dotfiles/home/scripts/couleur && cargo build --release && cp target/release/couleur ~/.local/bin/couleur";
                gs = "git status";
                gl = "git log";
                gcm = "git commit -m";
                gca = "git commit --amend";
                gcaa = "git commit -a --amend";
            };
            initContent = ''
                setopt ignore_eof

                function fzkill() {
                    ps aux | fzf --height 40% --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -r sudo kill
                }

                PROMPT=' %{$fg[magenta]%}%0*%{$reset_color%} %{$fg[cyan]%}%0~%{$reset_color%} $(git_prompt_info)$ '

                # mise (universal version manager)
                eval "$(mise activate zsh)"

                # sdkman (Java/JVM toolchains)
                export SDKMAN_DIR="$HOME/.sdkman"
                [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
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
        git = {
            enable = true;
            package = null;
            settings = {
                user.name = "dec";
                user.email = "gavind2559@gmail.com";
                init.defaultBranch = "main";
                pull.rebase = true;
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
                "file://${config.home.homeDirectory}/Documents Documents"
                "file://${config.home.homeDirectory}/Pictures Pictures"
                "file://${config.home.homeDirectory}/Videos Videos"
                "file://${config.home.homeDirectory}/programming programming"
                "file:///mnt mnt"
            ];
        };
    };
}
