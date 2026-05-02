{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.hardware.enable (
    lib.mkMerge [

      {
        boot.loader.timeout = 8;
      }

      (lib.mkIf (config.thattem.private.boot.type == "UEFI") {

        boot.loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };

      })

      (lib.mkIf (config.thattem.private.boot.type == "BIOS") {

        boot.loader.grub = {
          enable = true;
          device = "/dev/sda";
        };

      })

    ]
  );

}
