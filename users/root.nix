{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.special.enable {

    users.users.root = {
      uid = 0;
      name = "root";
      hashedPasswordFile = config.thattem.secrets.passwords.users.root.path;
    };
  };

}
