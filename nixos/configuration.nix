{ ... }: {
    imports = [
        ./hardware-configuration.nix
        ./base.nix
        ./boot.nix
        ./system.nix
        ./users.nix
    ];
}
