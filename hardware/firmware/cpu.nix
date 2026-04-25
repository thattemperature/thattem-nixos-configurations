{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.hardware.enable (
    lib.mkIf (config.thattem.private.firmware.cpu == "intel") {

      hardware.cpu.intel.updateMicrocode = true;

    }
  );

}
