{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.desktop.enable {

    programs.clash-verge = {
      enable = true;
      serviceMode = true;
      tunMode = true;
      autoStart = true;
    };
  };

}
