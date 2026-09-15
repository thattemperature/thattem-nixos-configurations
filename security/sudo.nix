{ config, lib, ... }:

{

  config = lib.mkMerge [

    {
      security.sudo.execWheelOnly = true;
    }

    (lib.mkIf (config.thattem.nixos.type == "common") {
      security.sudo.wheelNeedsPassword = false;
    })
  ];

}
