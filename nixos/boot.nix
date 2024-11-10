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

    services.xserver = {
        enable = true;
            displayManager.gdm = {
            enable = true;
            wayland = true;
        };
    };
}
