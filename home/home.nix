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
            eza
            gruvbox-dark-gtk

            firefox
            vesktop
            vscode
            jetbrains.idea-community
            spotify
            figma-linux
            obsidian

            pipes
            cbonsai
            cmatrix
            asciiquarium
            sl
            btop
            lolcat
            tty-clock
            figlet

            (rustPlatform.buildRustPackage {
                pname = "couleur";
                version = "0.1.0";

                src = pkgs.lib.cleanSource ./scripts/couleur;
                cargoLock.lockFile = ./scripts/couleur/Cargo.lock;
            })
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
                hmbs = "home-manager build switch";
                nrbs = "sudo nixos-rebuild switch";
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
        vscode = {
            enable = true;
            enableUpdateCheck = false;
            mutableExtensionsDir = false;
            enableExtensionUpdateCheck = false;
            extensions = with pkgs.vscode-extensions; [
                mkhl.direnv
                rust-lang.rust-analyzer
                vscodevim.vim
                github.copilot
                github.copilot-chat
                tamasfe.even-better-toml
                jdinhlife.gruvbox
                ms-python.python
                ms-python.vscode-pylance
                esbenp.prettier-vscode
                bbenoist.nix
                pkief.material-icon-theme
                bradlc.vscode-tailwindcss
                ms-vscode.cpptools
                ms-vscode.cmake-tools
                ms-vscode.cpptools-extension-pack
                twxs.cmake
            ];
            userSettings = {
                workbench = {
                    colorTheme = "Gruvbox Dark Hard";
                    iconTheme = "material-icon-theme";
                };
                editor = {
                    minimap.enabled = false;
                    fontFamily = "'CaskaydiaCove Nerd Font Mono', 'JetBrains Nerd Font Mono', monospace";
                    fontWeight = 600;
                    fontLigatures = true;
                    cursorStyle = "block";
                    cursorBlinking = "blink";
                    mouseWheelZoom = true;
                    fontSize = 16;
                };
                window = {
                    menuBarVisibility = "toggle";
                };
                files.exclude = {
                    "**/.git" = false;
                };
                vim.handleKeys = {
                    "<C-d>" = true;
                    "<C-s>" = false;
                    "<C-z>" = false;
                    "<C-p>" = false;
                };
                direnv.restartAutomatic = true;
                git.openRepositoryInParentFolders = "never";
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
