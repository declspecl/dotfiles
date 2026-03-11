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
            PATH = "$HOME/.local/bin:$PATH";
        };

        packages = with pkgs; [
            clang
            gnumake
            cmake
            awscli

            lua-language-server
            vscode-langservers-extracted

            ghostty
            kitty
            neovim
            emacs-pgtk

            wofi
            mako
            waybar
            wlogout
            hyprpaper
            hyprpicker
            nwg-look
            nemo
            vlc
            mpv
            eza
            smile
            grim
            slurp
            wl-clipboard
            playerctl
            pavucontrol
            pamixer
            brightnessctl
            tmux

            firefox
            vesktop
            vscode
            jetbrains-toolbox
            spotify
            figma-linux
            obsidian
            google-chrome
            libreoffice-qt6

            ripgrep
            fzf
            fd
            fastfetch
            wget
            htop
            code-cursor-fhs

            pipes
            cbonsai
            cmatrix
            asciiquarium
            sl
            btop
            lolcat
            tty-clock
            figlet

            melonds
            vbam

            nerd-fonts.agave
            nerd-fonts.caskaydia-cove
            nerd-fonts.caskaydia-mono
            nerd-fonts.dejavu-sans-mono
            nerd-fonts.droid-sans-mono
            nerd-fonts.fira-code
            nerd-fonts.fira-mono
            nerd-fonts.geist-mono
            nerd-fonts.go-mono
            nerd-fonts.iosevka
            nerd-fonts.iosevka-term
            nerd-fonts.jetbrains-mono
            nerd-fonts.meslo-lg
            nerd-fonts.monoid
            nerd-fonts.noto
            nerd-fonts.roboto-mono
            nerd-fonts.space-mono
            nerd-fonts.symbols-only
            nerd-fonts.terminess-ttf
            nerd-fonts.tinos
            nerd-fonts.ubuntu
            nerd-fonts.ubuntu-mono
            nerd-fonts.ubuntu-sans
            nerd-fonts.victor-mono
            nerd-fonts.zed-mono
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
        direnv = {
            enable = true;
            nix-direnv.enable = true;
            enableZshIntegration = true;
        };
        git = {
            enable = true;
            package = pkgs.gitFull;
            settings = {
                user.name = "dec";
                user.email = "gavind2559@gmail.com";
                init.defaultBranch = "main";
                pull.rebase = true;
            };
        };
        vscode = {
            enable = true;
            profiles.default = {
                enableUpdateCheck = false;
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
                    unifiedjs.vscode-mdx
                    usernamehw.errorlens
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
