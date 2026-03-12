import os
import shutil
import subprocess


PACMAN_PACKAGES = [
    # terminals
    "ghostty",
    "kitty",

    # general utils
    "firefox",
    "vlc",
    "mpv",
    "grim",
    "slurp",
    "wl-clipboard",
    "nemo",

    # i/o & hardware
    "playerctl",
    "pavucontrol",
    "pamixer",
    "brightnessctl",
    "bluez",
    "bluez-utils",
    "blueman",

    # ricing & desktop
    "waybar",
    "mako",
    "wofi",
    "hyprpaper",
    "hyprpicker",
    "nwg-look",
    "nwg-dock-hyprland",
    "kvantum",
    "qt5ct",
    "qt6ct",
    "inter-font",
    "sassc",
    "inkscape",
    "gtk-update-icon-cache",

    # cli power tools
    "eza",
    "tmux",
    "ripgrep",
    "fzf",
    "fd",
    "fastfetch",
    "wget",
    "htop",
    "btop",

    # editors
    "neovim",
    "emacs-wayland",

    # development
    "clang",
    "make",
    "cmake",
    "aws-cli",
    "lua-language-server",
    "docker",
    "docker-buildx",

    # system & drivers
    "mesa",
    "vulkan-radeon",
    "mesa-utils",
    "libva-mesa-driver",
    "wayland",
    "xorg-xwayland",
    "xdg-desktop-portal-hyprland",
    "xdg-desktop-portal-gtk",
    "gdm",
    "pipewire",
    "pipewire-pulse",
    "wireplumber",

    # multimedia
    "ffmpeg",
    "ffmpegthumbnailer",

    # fonts
    "ttf-cascadia-code-nerd",
    "ttf-jetbrains-mono-nerd",
    "ttf-firacode-nerd",

    # eye candy
    "cmatrix",
    "asciiquarium",
    "sl",
    "lolcat",
    "figlet",
]

AUR_PACKAGES = [
    # themes
    "whitesur-gtk-theme",
    "whitesur-icon-theme",
    "whitesur-cursor-theme",
    "kvantum-theme-whitesur-git",

    # daily utils
    "vesktop-bin",
    "spotify",
    "smile",
    "figma-linux-bin",
    "obsidian",
    "google-chrome",
    "libreoffice-fresh",

    # ricing
    "wlogout",

    # coding
    "visual-studio-code-bin",
    "jetbrains-toolbox",
    "cursor-bin",

    # gaming
    "melonds",
    "vbam-wx",

    # eye candy
    "cbonsai",
    "pipes.sh",
    "tty-clock",
]

SYSTEMD_SYSTEM_SERVICES = [
    "NetworkManager",
    "bluetooth",
    "docker",
    "gdm",
]

SYSTEMD_USER_SERVICES = [
    "pipewire",
    "pipewire-pulse",
    "wireplumber",
]

USER_GROUPS = ["wheel", "video", "audio", "network", "docker"]


def run(cmd, **kwargs):
    print(f"  $ {' '.join(cmd)}")
    subprocess.run(cmd, check=True, **kwargs)


def main():
    dotfiles = os.path.expanduser("~/.dotfiles")

    print("==> Installing pacman packages...")
    run(["sudo", "pacman", "-Syu", "--needed"] + PACMAN_PACKAGES)

    print("==> Installing yay (AUR helper)...")
    if shutil.which("yay") is None:
        run(["sudo", "pacman", "-S", "--needed", "git", "base-devel"])
        run(["git", "clone", "https://aur.archlinux.org/yay.git", "/tmp/yay"])
        run(["makepkg", "-si", "--noconfirm"], cwd="/tmp/yay")
        run(["rm", "-rf", "/tmp/yay"])

    print("==> Installing AUR packages...")
    run(["yay", "-S", "--needed", "--noconfirm"] + AUR_PACKAGES)

    print("==> Enabling system services...")
    for svc in SYSTEMD_SYSTEM_SERVICES:
        run(["sudo", "systemctl", "enable", svc])

    print("==> Enabling user services...")
    run(["systemctl", "--user", "enable"] + SYSTEMD_USER_SERVICES)

    print("==> Adding user to groups...")
    run(["sudo", "usermod", "-aG", ",".join(USER_GROUPS), "dec"])

    print("==> Building couleur...")
    couleur_dir = os.path.join(dotfiles, "home/scripts/couleur")
    run(["cargo", "build", "--release"], cwd=couleur_dir)
    os.makedirs(os.path.expanduser("~/.local/bin"), exist_ok=True)
    run(["cp", os.path.join(couleur_dir, "target/release/couleur"), os.path.expanduser("~/.local/bin/couleur")])

    print("==> Linking dotfiles...")
    run(["sh", os.path.join(dotfiles, "link.sh")])

    print()
    print("Bootstrap complete!")
    print("Next steps:")
    print("  1. couleur render")
    print("  2. home-manager switch")
    print("  3. Reboot, then log in via GDM to start Hyprland")


if __name__ == "__main__":
    main()
