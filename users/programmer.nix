{ config, lib, ... }:

{

  config = lib.mkIf config.thattem-nixos.special.enable {

    users.users.programmer = {
      isNormalUser = true;
      name = "programmer";
      description = "Programmer";
      home = "/home/programmer";
      extraGroups = [ "wheel" ];
      hashedPasswordFile = config.age.secrets.user-password-programmer.path;
    };
  };

}
