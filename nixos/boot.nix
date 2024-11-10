{ ... }: {
    boot.loader = {
        efi = {
           canTouchEfiVariables = true; 
           efiSysMountPoint = "/boot/efi";
        };
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
        };
    };

    services.xserver.displayManager.gdm = {
        enable = true;
        wayland = true;
    };
}
