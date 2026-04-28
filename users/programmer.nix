{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.special.enable (
    lib.mkIf config.thattem.nixos.programming.enable {

      users.users.programmer = {
        isNormalUser = true;
        name = "programmer";
        description = "Programmer";
        home = "/home/programmer";
        extraGroups = [ "wheel" ];
        hashedPasswordFile = config.thattem.secrets.passwords.users.programmer.path;
      };
    }
  );

}
