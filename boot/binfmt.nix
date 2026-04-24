{ config, lib, ... }:

{

  config = lib.mkIf config.thattem-nixos.hardware.enable (
    lib.mkIf config.thattem-nixos.advanced.enable {

      boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
    }
  );

}
