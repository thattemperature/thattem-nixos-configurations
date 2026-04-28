{ config, lib, ... }:

{

  config = lib.mkIf (config.thattem.nixos.type == "server") (
    lib.mkMerge [

      {
        services.syncthing =
          let
            userName = "thattemperature";
            user = config.users.users.${userName};
          in
          {
            enable = true;
            user = userName;
            group = user.group;
            dataDir = user.home;
          };
      }

      (lib.mkIf config.thattem.nixos.special.enable {
        services.syncthing = {
          key = config.private.syncthing.key;
          cert = config.private.syncthing.cert;
          settings = {
            devices = config.private.syncthing.devices;
            folders = {
              "default" = {
                label = "Default Folder";
                id = "default";
                path = "~/Sync/Default";
                type = "receiveonly";
                devices = config.private.syncthing.default-folder-devices;
              };
              "temporary" = {
                label = "Temporary Files";
                id = "temporary";
                path = "~/Sync/Temporary";
                type = "receiveonly";
                devices = config.private.syncthing.temporary-folder-devices;
              };
              "archive" = {
                label = "Archived Files";
                id = "archive";
                path = "~/Sync/Archive";
                type = "receiveonly";
                devices = config.private.syncthing.archive-folder-devices;
              };
              "secret" = {
                label = "Secret Files";
                id = "secret";
                path = "~/Sync/Secret";
                type = "receiveencrypted";
                devices = config.private.syncthing.secret-folder-devices;
              };
              "secret-2" = {
                label = "Second Secret Files";
                id = "secret-2";
                path = "~/Sync/Secret-2";
                type = "receiveencrypted";
                devices = config.private.syncthing.secret-folder-2-devices;
              };
            };
            options = {
              localAnnounceEnabled = true;
              relaysEnabled = true;
              urAccepted = 3;
            };
            gui = {
              theme = "default";
              user = "thattemperature";
            };
          };
          guiPasswordFile = config.age.secrets.syncthing-password.path;
        };
      })

    ]
  );

}
