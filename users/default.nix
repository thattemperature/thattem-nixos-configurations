{ config, lib, ... }:

{

  imports = [
    ./gdm.nix
    ./programmer.nix
    ./root.nix
    ./thattemperature.nix
  ];

  config = lib.mkIf config.thattem-nixos.special.enable {
    users.mutableUsers = false;
  };

}
