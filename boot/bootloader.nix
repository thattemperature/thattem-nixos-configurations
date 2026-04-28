{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.hardware.enable (
    lib.mkMerge [

      {
        boot.loader.timeout = 8;
      }

      (lib.mkIf (config.thattem.nixos.type == "common") {

        boot.loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };

      })

      (lib.mkIf (config.thattem.nixos.type == "server") {

        boot.loader.grub = {
          enable = true;
          device = "/dev/sda";
        };

      })

    ]
  );

}
