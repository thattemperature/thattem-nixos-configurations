{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.advanced.enable {

    services.fwupd.enable = true;
  };

}
