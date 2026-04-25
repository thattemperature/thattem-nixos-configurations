{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.advanced.enable {

    programs.steam.enable = true;
  };

}
