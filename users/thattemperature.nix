{ config, lib, ... }:

{

  config = lib.mkMerge [

    {
      users.users.thattemperature = {
        isNormalUser = true;
        name = "thattemperature";
        description = "That Temperature";
        extraGroups = lib.mkMerge [
          (lib.mkIf (config.thattem.nixos.type == "common") [
            config.users.groups.root.name
          ])
          [
            config.users.groups.networkmanager.name
            config.users.groups.wheel.name
          ]
        ];
      };

    }

    (lib.mkIf config.thattem.nixos.special.enable {
      users.users.thattemperature = {
        hashedPasswordFile = config.thattem.secrets.passwords.users.thattemperature.path;
        openssh.authorizedKeys.keys = config.thattem.private.ssh.trusted-public-keys;
      };
    })

  ];

}
