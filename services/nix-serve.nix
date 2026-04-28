{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = lib.mkIf config.thattem.nixos.advanced.enable (
    lib.mkIf config.thattem.nixos.special.enable {

      services.nix-serve = {
        enable = true;
        package = pkgs.nix-serve-ng;
        secretKeyFile = config.thattem.secrets.nix-serve-key.path;
      };
    }
  );

}
