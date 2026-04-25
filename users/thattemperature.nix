{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.special.enable {

    users.users.thattemperature = {
      isNormalUser = true;
      name = "thattemperature";
      description = "That Temperature";
      home = "/home/thattemperature";
      extraGroups = [
        "root"
        "networkmanager"
        "wheel"
      ];
      hashedPasswordFile = config.age.secrets.user-password-thattemperature.path;
      openssh.authorizedKeys.keys = config.thattem.private.ssh.trusted-public-keys;
    };
  };

}
