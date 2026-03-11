#!/bin/sh
set -e

echo "==> Installing pacman packages..."
sudo pacman -Syu --needed \
    ghostty kitty firefox \
    waybar mako wofi \
    hyprpaper hyprpicker nwg-look nemo \
    vlc mpv eza grim slurp wl-clipboard playerctl \
    pavucontrol pamixer brightnessctl tmux \
    ripgrep fzf fd fastfetch wget htop \
    neovim emacs-wayland \
    clang make cmake aws-cli \
    lua-language-server \
    mesa vulkan-radeon mesa-utils libva-mesa-driver \
    wayland xorg-xwayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
    gdm \
    pipewire pipewire-pulse wireplumber \
    bluez bluez-utils blueman \
    ffmpeg ffmpegthumbnailer \
    docker docker-buildx \
    ttf-cascadia-code-nerd ttf-jetbrains-mono-nerd ttf-firacode-nerd \
    cmatrix asciiquarium sl btop lolcat figlet

echo "==> Installing yay (AUR helper)..."
if ! command -v yay &>/dev/null; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
fi

echo "==> Installing AUR packages..."
yay -S --needed --noconfirm \
    wlogout \
    vesktop-bin \
    visual-studio-code-bin \
    jetbrains-toolbox \
    spotify \
    figma-linux-bin \
    obsidian \
    google-chrome \
    libreoffice-fresh \
    cursor-bin \
    smile \
    melonds \
    vbam-wx \
    cbonsai \
    pipes.sh \
    tty-clock

echo "==> Enabling system services..."
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable docker
sudo systemctl enable gdm

echo "==> Enabling user services..."
systemctl --user enable pipewire pipewire-pulse wireplumber

echo "==> Adding user to groups..."
sudo usermod -aG wheel,video,audio,network,docker dec

echo "==> Building couleur..."
cd ~/.dotfiles/home/scripts/couleur
cargo build --release
mkdir -p ~/.local/bin
cp target/release/couleur ~/.local/bin/couleur
cd ~/.dotfiles

echo "==> Linking dotfiles..."
sh ~/.dotfiles/link.sh

echo ""
echo "Bootstrap complete!"
echo "Next steps:"
echo "  1. couleur render"
echo "  2. home-manager switch"
echo "  3. Reboot, then log in via GDM to start Hyprland"
