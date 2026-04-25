{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.special.enable {

    users.users.root = {
      uid = 0;
      name = "root";
      hashedPasswordFile = config.age.secrets.user-password-root.path;
    };
  };

}
